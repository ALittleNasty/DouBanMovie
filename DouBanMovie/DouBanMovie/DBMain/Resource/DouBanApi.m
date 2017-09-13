#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/** Api Key */
NSString const *DBApiKey = @"0b2bdeda43b5688921839c8ecb20399b";

/** 当前城市 */
NSString const *CurrentCity = @"上海";

/** 上映的电影列表 */
NSString const *HotMovieURL = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E4%B8%8A%E6%B5%B7&start=0&count=100&client=&udid=";

/** 电影介绍 */
NSString const *MovieDescriptionURL = @"http://api.douban.com/v2/movie/subject/26865690?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&client=&udid=";

/** 电影图片 */
NSString const *MovieImagesURL = @"https://api.douban.com/v2/movie/subject/26865690/photos?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=100&client=&udid=";

/** 电影短评 */
NSString const *MovieShortCommentsURL = @"https://api.douban.com/v2/movie/subject/26865690/reviews?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=20&client=&udid=";

/** 电影影评 */
NSString const *MovieCommentsURL = @"https://api.douban.com/v2/movie/subject/26865690/comments?apikey=0b2bdeda43b5688921839c8ecb20399b&count=20&client=&udid=";
