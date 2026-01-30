//
//  CountryUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.11.25.
//

import Foundation

protocol CountryUseCase {
    func getAllCountries(completion: @escaping (([Country]?, String?) -> Void))
    func getCountry(byName name: String, completion: @escaping ((Country?, String?) -> Void))
    func getRandomCountry(completion: @escaping ((Country?, String?) -> Void))
}
