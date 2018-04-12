
import Alamofire

@objc public class VMRemoteConfig: NSObject {
    
    public static func check(url: URL) {
        
        func handle(error: Error) {
            
            print(error.localizedDescription)
            
        }
        
        func handle(config: AppConfig?) {
            
            guard let config = config else { return }
            
            if config.isNewerVersionAvailable {
                
                let message = config.force ? "Tienes que actualizar" : "¿Quieres actualizar?"
                
                let action = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                    guard let url = config.url else { return }
                    UIApplication.shared.openURL(url)
                })
                
                let alert = UIAlertController(title: "Nueva versión disponible", message: message, preferredStyle: .alert)
                
                alert.addAction(action)
                
                if !config.force { alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel)) }
                
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
            }
        }

        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                
                case .success(let value):
                    
                    guard let json = value as? JSONDictionary else {
                        handle(error: VMRemoteConfigError.couldNotDecodeJSON)
                        return
                    }
                    
                    handle(config: decode(dictionary: json))
                
                case .failure(let error):
                    
                    handle(error: VMRemoteConfigError.other(error))
                }
        }
    }
}
