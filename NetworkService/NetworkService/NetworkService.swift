//
//  NetworkService.swift
//  NetworkService
//
//  Created by satrio.wicaksono on 16/09/20.
//  Copyright © 2020 Playground. All rights reserved.
//

import Foundation
import Moya

public protocol NetworkServiceProtocol: class {
    func request<T: TargetType, M: Decodable>(target: T, model: M.Type, completion: @escaping (Result<M, Error>) -> Void)
}

public class Provider: NetworkServiceProtocol {
    
    private var provider: MoyaProvider<MultiTarget>
    
    init() {
        self.provider = MoyaProvider<MultiTarget>()
    }
    
    public func request<T, M>(target: T, model: M.Type, completion: @escaping (Result<M, Error>) -> Void) where T : TargetType, M : Decodable {
        self.provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let result = try filteredResponse.map(M.self)
                    completion(.success(result))
                } catch(let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

public class NetworkService {
    
    public static let shared = NetworkService()
    private weak var delegate: NetworkServiceProtocol?
    
    init(networkServiceProtocol: NetworkServiceProtocol = Provider()) {
        self.delegate = networkServiceProtocol
    }
    
    public func request<T: TargetType, M: Decodable>(target: T, model modelType: M.Type, completion: @escaping (Result<M, Error>) -> Void ){
        self.delegate?.request(target: target, model: modelType, completion: completion)
    }
}
