//
//  Webservice.swift
//  APIRequest
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import Foundation

class WebService {
    
    func getTeamInfo(completion: @escaping (TeamWrapper) -> ()) {
        guard let url = URL(string: "https://statsapi.web.nhl.com/api/v1/teams/10") else {
            fatalError("URL is not correct!")
        }
    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let teamWrapper = try! JSONDecoder().decode(TeamWrapper.self, from: data!)
            DispatchQueue.main.async {
                completion(teamWrapper)
            }
        }.resume()
    }
    
    func getRosterInfo(completion: @escaping (RosterWrapper_APIReturn) -> ()) {
        guard let url = URL(string: "https://statsapi.web.nhl.com/api/v1/teams/10/roster") else {
            fatalError("URL is not correct!")
        }
    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let rosterWrapper_APIReturn = try! JSONDecoder().decode(RosterWrapper_APIReturn.self, from: data!)
            DispatchQueue.main.async {
                completion(rosterWrapper_APIReturn)
            }
        }.resume()
    }
    
    func getStatsInfo(playerID:String, completion: @escaping (StatsWrapper) -> ()) {
        guard let url = URL(string: "https://statsapi.web.nhl.com/api/v1/people/"+playerID+"/stats?stats=statsSingleSeason&season=20192020") else {
            fatalError("URL is not correct!")
        }
    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let statsWrapper = try! JSONDecoder().decode(StatsWrapper.self, from: data!)
            DispatchQueue.main.async {
                completion(statsWrapper)
            }
        }.resume()
    }
    
    func getStickDataInfo(completion: @escaping (StickAction) -> ()) {
        guard let url = URL(string: "http://34.68.215.40/action/api/task") else {
            fatalError("URL is not correct!")
        }
    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let stickAction = try! JSONDecoder().decode(StickAction.self, from: data!)
            DispatchQueue.main.async {
                completion(stickAction)
            }
        }.resume()
    }
}
