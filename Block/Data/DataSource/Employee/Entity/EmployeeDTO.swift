//
//  EmployeeDTO.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

struct EmployeesDTO {
    let employees: [EmployeeDTO]
}

extension EmployeesDTO: Decodable {
    // MARK: Keys
    private enum CodingKeys: String, CodingKey {
        case employees
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.employees = try container.decode([EmployeeDTO].self, forKey: .employees)
    }
}

struct EmployeeDTO {
    // MARK: Properties
    let id: String
    let name: String
    let phone: String
    let email: String
    let biography: String
    let smallPhoto: String
    let largePhoto: String
    let team: String
    let employeeType: String
}

extension EmployeeDTO: Decodable {
    // MARK: Keys
    private enum EmployeeKeys: String, CodingKey {
        case id = "uuid"
        case name = "full_name"
        case phone = "phone_number"
        case email = "email_address"
        case biography = "biography"
        case smallPhoto = "photo_url_small"
        case largePhoto = "photo_url_large"
        case team = "team"
        case employeeType = "employee_type"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EmployeeKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.email = try container.decode(String.self, forKey: .email)
        self.biography = try container.decode(String.self, forKey: .biography)
        self.smallPhoto = try container.decode(String.self, forKey: .smallPhoto)
        self.largePhoto = try container.decode(String.self, forKey: .largePhoto)
        self.team = try container.decode(String.self, forKey: .team)
        self.employeeType = try container.decode(String.self, forKey: .employeeType)
    }
}
