//
//  ApiCaller.swift
//  Netflix Clone
//
//  Created by srte on 22-04-22.
//

import Foundation

struct K {
    static let API_KEY = "4936b271d28ceb320ef9e012cf1363d7"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let YoutubeAPI_KEY = "AIzaSyDw-kFdsEzdzBUl3Na8KcfyWSIkl5TPyJc"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)trending/movie/day?api_key=\(K.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)trending/tv/day?api_key=\(K.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)movie/upcoming?api_key=\(K.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)movie/popular?api_key=\(K.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)movie/top_rated?api_key=\(K.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(K.baseURL)discover/movie?api_key=\(K.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }

        guard let url = URL(string: "\(K.baseURL)search/movie?api_key=\(K.API_KEY)&query=\(query)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(result.results))

            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(K.YoutubeBaseURL)q=\(query)&key=\(K.YoutubeAPI_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(result.items[0]))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
