import OPBJARVIS

class OPBGetNotificationSettingsRequest: OPBBaseRequest {

    override func baseUrl() -> String {
        return OPBNetworkManager.shared.baseUrl("nqrHost") ?? ""
    }

    override func requestUrl() -> String {
        return "/api/v1/notification/settings"
    }

    override func requestMethod() -> OPBHTTPMethod {
        return .get
    }

    override func encryptType() -> OPBEncryptType {
        return .kong
    }
}
