import OPBJARVIS

class OPBUpdateNotificationSettingsRequest: OPBBaseRequest {
    var pushEnabled: Bool = false

    override func baseUrl() -> String {
        return OPBNetworkManager.shared.baseUrl("nqrHost") ?? ""
    }

    override func requestUrl() -> String {
        return "/api/v1/notification/settings"
    }

    override func requestMethod() -> OPBHTTPMethod {
        return .put
    }

    override func encryptType() -> OPBEncryptType {
        return .kong
    }

    override func requestArgument() -> Any? {
        return [
            "push_enabled": pushEnabled
        ]
    }
}
