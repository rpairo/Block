//
//  EmployeeAPIDataSource+Decode.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

// MARK: Result
typealias CheckErrorsResult = Result<EmployeesDTO, FetchEmployeeError>

// MARK: Decode
extension EmployeeAPIDataSource {
    func decode(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> CheckErrorsResult {
        if let error = checkErrors(response, error) {
            return .failure(error)
        }

        guard let data = data else {
            return .failure(.data)
        }

        guard let employees = try? JSONDecoder().decode(EmployeesDTO.self, from: data) else {
            return .failure(.decoding)
        }

        guard !employees.employees.isEmpty else {
            return .failure(.emptyList)
        }

        return .success(employees)
    }

    func checkErrors(_ response: URLResponse?, _ error: Error?) -> FetchEmployeeError? {
        guard error == nil else {
            return .unkown
        }

        if let code = (response as? HTTPURLResponse)?.statusCode, code != 200 {
            return .statusCode(code)
        }

        return nil
    }

    func transform(dto: EmployeesDTO) -> [Employee] {
        dto.employees.map {
            Employee(
                id: $0.id,
                name: $0.name,
                phone: $0.phone,
                email: $0.email,
                biography: $0.biography,
                smallPhoto: $0.smallPhoto,
                largePhoto: $0.largePhoto,
                team: $0.team,
                employeeType: $0.employeeType
            )
        }
    }
}
