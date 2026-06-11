import OPBJARVIS

class OPBLoginResponse: OPBResponseModel {
    var token: String = ""
    var userId: String = ""
    var expireTime: Int = 0
}
