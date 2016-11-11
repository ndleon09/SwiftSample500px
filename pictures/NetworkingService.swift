//
//  NetworkingService.swift
//  pictures
//
//  Created by Nelson Dominguez on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

extension String {
    
    /// Percent escape value to be added to a URL query value as specified in RFC 3986
    ///
    /// This percent-escapes all characters besize the alphanumeric character set and "-", ".", "_", and "~".
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: Return precent escaped string.
    
    func stringByAddingPercentEncodingForURLQueryValue() -> String? {
        
        let characterSet = NSMutableCharacterSet.alphanumeric()
        characterSet.addCharacters(in: "-._~")
        return self.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)
    }
}

extension Dictionary {
    
    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    func stringFromHttpParameters() -> String {
        
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).stringByAddingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
}

protocol NetworkingService {
    
    func findMostPopularPictures(completion: @escaping ([AnyObject]) -> ())
}

class NetworkingServiceImp: NetworkingService {

    fileprivate var baseURL = "https://api.500px.com/v1"
    fileprivate let consumerKey = "FMEvCvHM8Ask8kF1BzJa9yEvznnmpHwYxME3S3dh"
    
    func findMostPopularPictures(completion: @escaping ([AnyObject]) -> ()) {
        
        let parameters : [String:String] = ["feature": "popular", "sort": "rating", "sort_direction": "desc", "image_size": "440", "consumer_key": consumerKey]
        let url = URL(string: "\(self.baseURL)/photos?\(parameters.stringFromHttpParameters())")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            
            if error == nil {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                    let photos = dictionary["photos"] as! [AnyObject]
                    completion(photos)
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                    completion([])
                }
            }
            else {
                completion([])
            }
        }) 
        task.resume()
    }
}
