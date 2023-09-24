//import Foundation
//
import UIKit
//
//class NetworkManager {
//    
//    typealias ImageDownloadCompletion = (Result<UIImage, Error>) -> Void
//    
//    func downloadImage(from url: URL, completion: @escaping ImageDownloadCompletion) {
////        let request = URLRequest(url: url)
////        let session = U
////        let session = URLSession().downloadTask(with: request) { url, response, error in
////            print(url)
////        }
//        
//        
//    }
//    
//    
//    func downlaodData(from url: URL) async -> (UIImage?, Error?) {
//        do {
//            let resp = try await URLSession.shared.data(from: url)
//            let image = UIImage(data: resp.0)
//           
//            return (image, nil)
//        } catch {
//            
//        }
//        return (nil, Error)
//    }
//    
//}
//
//
//let nm = NetworkManager()
//
//let url = URL(string: "https://fastly.picsum.photos/id/652/200/300.jpg?hmac=yJT5T1Ugojp0HlslsxDN_nNnIIk4lsFXcV_5rq9FCTw")!
//
//
//Task {
//    await nm.downlaodData(from: url)
//}

//nm.downloadImage(from: url) { image in
////    print(image)
//}
//
//class ViewController: UIViewController {
//    
//    @IBOutlet private weak imageView: UIImageView!
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        
//        let networkManager = NetworkManager()
//        
//        if let imageUrl = URL(string: "https://example.com/image.jpg") {
//            
//            networkManager.downloadImage(from: imageUrl) { result in
//                
//                switch result {
//                    
//                case .success(let image):
//                    
//                    self.imageView.image = image
//                    
//                    let alertController = UIAlertController(title: "Download Image", message: "Image Downloaded successfully", preferredStyle: .alert)
//                    
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    
//                    self.present(alertController, animated: true, completion: nil)
//                    
//                case .failure(let error):
//                    
//                    print("Error downloading image: \(error)")
//                    
//                }
//
//}
//
//}
//
//}
//
//}


//struct viewModel {}
//
//struct ViewModel {
//    
//    var arr: [Int] = [1, 2, 3]
//    
//    
//    func modify(_ arr: [Int]) {
//        
//    }
//}


//var arr = [1, 2, 3]
//
//
//    for i in 0..<1000000 {
//        var arr1 = arr
//    }
//
//
//arr1.append(4)
//
//
//
//
//
//print(arr)
//print(arr1)
//
//[1, 2, 3]
//[1, 2, 3, 4]



class DemoVC: UIViewController {
    override func viewDidLoad() {
        DispatchQueue.main.sync {
            print("abcd")
        }
    }
}


//let cv = DemoVC()

//DispatchQueue.main.sync {
//
//DispatchQueue.main.sync {
//
//print("abcd")
//
//}
//
//}
