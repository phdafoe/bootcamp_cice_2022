//
//  LocalizedKeys.swift
//  CiceMusic
//
//  Created by TECDATA ENGINEERING on 15/2/22.
//

import Foundation

struct LocalizedKeys {
    
    // GENERAL
    struct General {
        static let generalAccept = "general_accept".localized
        static let generalCancel = "general_cancel".localized
    }
    
    // LOGIN
    struct Login {
        static let titleAlertLoginSuccess = "title_my_alert_login_success".localized
        static let messageAlertLoginSuccess = "message_my_alert_login_success".localized
        static let titleAlertLoginFailure = "title_my_alert_login_failure".localized
        static let messageAlertLoginFailure = "message_my_alert_login_failure".localized
    }

    // REGISTRO




    // BUROFAX
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
