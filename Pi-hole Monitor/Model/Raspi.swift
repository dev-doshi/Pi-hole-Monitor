//
//  Raspi.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 12.06.23.
//

import Foundation
import SwiftData

// http://192.168.178.54/admin/api.php

@Model
final class Raspi {
    
    var ip: String
    var token: String
        
    init(ip: String, token: String) {
        self.ip = ip
        self.token = token
    }
}

struct Status: Decodable {
    var status: String?
}

struct Summary: Decodable {
    var domainsBeingBlocked = "NaN"
    var dnsQueriesToday = "NaN"
    var adsBlockedToday = "NaN"
    var adsPercentageToday = "NaN"
    var uniqueDomains = "NaN"
    var queriesForwarded = "NaN"
    var queriesCached = "NaN"
    var clientsEverSeen = "NaN"
    var uniqueClients = "NaN"
    var dnsQueriesAllTypes = "NaN"
    var replyUNKNOWN = "NaN"
    var replyNODATA = "NaN"
    var replyNXDOMAIN = "NaN"
    var replyCNAME = "NaN"
    var replyIP = "NaN"
    var replyDOMAIN = "NaN"
    var replyRRNAME = "NaN"
    var replySERVFAIL = "NaN"
    var replyREFUSED = "NaN"
    var replyNOTIMP = "NaN"
    var replyOTHER = "NaN"
    var replyDNSSEC = "NaN"
    var replyNONE = "NaN"
    var replyBLOB = "NaN"
    var dnsQueriesAllReplies = "NaN"
    var privacyLevel = "NaN"
    var status = "NaN"
    var gravityLastUpdated = GravityLastUpdated()
    
    private enum CodingKeys: String, CodingKey {
        case domainsBeingBlocked = "domains_being_blocked"
        case dnsQueriesToday = "dns_queries_today"
        case adsBlockedToday = "ads_blocked_today"
        case adsPercentageToday = "ads_percentage_today"
        case uniqueDomains = "unique_domains"
        case queriesForwarded = "queries_forwarded"
        case queriesCached = "queries_cached"
        case clientsEverSeen = "clients_ever_seen"
        case uniqueClients = "unique_clients"
        case dnsQueriesAllTypes = "dns_queries_all_types"
        case replyUNKNOWN = "reply_UNKNOWN"
        case replyNODATA = "reply_NODATA"
        case replyNXDOMAIN = "reply_NXDOMAIN"
        case replyCNAME = "reply_CNAME"
        case replyIP = "reply_IP"
        case replyDOMAIN = "reply_DOMAIN"
        case replyRRNAME = "reply_RRNAME"
        case replySERVFAIL = "reply_SERVFAIL"
        case replyREFUSED = "reply_REFUSED"
        case replyNOTIMP = "reply_NOTIMP"
        case replyOTHER = "reply_OTHER"
        case replyDNSSEC = "reply_DNSSEC"
        case replyNONE = "reply_NONE"
        case replyBLOB = "reply_BLOB"
        case dnsQueriesAllReplies = "dns_queries_all_replies"
        case privacyLevel = "privacy_level"
        case status
        case gravityLastUpdated = "gravity_last_updated"
    }
}

struct GravityLastUpdated: Codable {
    var fileExists = false
    var absolute = -1
    var relative = RelativeTime()
    
    private enum CodingKeys: String, CodingKey {
        case fileExists = "file_exists"
        case absolute
        case relative
    }
}

struct RelativeTime: Codable {
    var days = -1
    var hours = -1
    var minutes = -1
}
