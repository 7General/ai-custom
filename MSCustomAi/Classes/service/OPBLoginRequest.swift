import OPBJARVIS

class OPBLoginRequest: OPBBaseRequest {
    var phone: String = ""
    var password: String = ""

    override func requestUrl() -> String {
        return "/api/v1/user/login"
    }

    override func requestArgument() -> Any? {
        return [
            "phone": phone,
            "password": password
        ]
    }
}
