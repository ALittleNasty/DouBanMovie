//
//  HotMovieCell.m
//  DouBanMovie
//
//  Created by ALittleNasty on 2017/9/13.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "HotMovieCell.h"
#import "Subject.h"
#import <SDWebImage/UIImageView+WebCache.h>

NSString *HotMovieCellID = @"HotMovieCellIdentifier";

@interface HotMovieCell ()

@property (weak, nonatomic) IBOutlet UIImageView *afficheImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *seenLabel;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (weak, nonatomic) IBOutlet UIImageView *starImage1;
@property (weak, nonatomic) IBOutlet UIImageView *starImage2;
@property (weak, nonatomic) IBOutlet UIImageView *starImage3;
@property (weak, nonatomic) IBOutlet UIImageView *starImage4;
@property (weak, nonatomic) IBOutlet UIImageView *starImage5;

@end

@implementation HotMovieCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _payButton.layer.cornerRadius = 5.0;
    _payButton.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (IBAction)payButtonAction:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(hotMovieCellPayButtonClick)]) {
        [self.delegate hotMovieCellPayButtonClick];
    }
    
}

- (void)setModel:(Subject *)model
{
    _model = model;
    
    [_afficheImageView sd_setImageWithURL:[NSURL URLWithString:_model.images.small]]; // 设置海报图片
    _nameLabel.text = _model.title; // 电影名称
    _ratingLabel.text = _model.rating.average; // 平均评分
    
    // 导演
    if (_model.directors.count) {
        SubjectDirector *director = _model.directors.firstObject;
        _directorLabel.text = [NSString stringWithFormat:@"导演: %@", director.name];
    }
    
    // 主演
    NSMutableString *actor = [NSMutableString string];
    for (NSInteger i = 0; i < _model.casts.count; i++) {
        SubjectDirector *cast = _model.casts[i];
        [actor appendFormat:@"%@/",cast.name];
    }
    if (actor.length > 0) {
        [actor replaceCharactersInRange:NSMakeRange(actor.length - 1, 1) withString:@""];
    }
    _actorLabel.text = [NSString stringWithFormat:@"主演: %@", actor];
    
    // 根据大陆的上映日期, 来判断显示 "预售" 还是 "购票" 以及 "看过"和"想看"
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *publistDate = [formatter dateFromString:_model.mainland_pubdate];
    NSDate *today = [NSDate date];
    NSComparisonResult result = [publistDate compare:today];
    if (result > 0) {
        
        _payButton.layer.borderWidth = 1.0;
        _payButton.layer.borderColor = [UIColor orangeColor].CGColor;
        [_payButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_payButton setTitle:@"预售" forState:UIControlStateNormal];
        _seenLabel.text = [NSString stringWithFormat:@"%@人想看", _model.collect_count];
    } else {
        
        _payButton.layer.borderWidth = 1.0;
        _payButton.layer.borderColor = [UIColor blueColor].CGColor;
        [_payButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_payButton setTitle:@"购票" forState:UIControlStateNormal];
        _seenLabel.text = [NSString stringWithFormat:@"%@人看过", _model.collect_count];
    }
    
    // 评分✨
    NSInteger ratingAverage = (NSInteger)([_model.rating.average floatValue] * 10);
    [self displayRatingStarWithRatingScore:ratingAverage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)displayRatingStarWithRatingScore:(NSInteger)score
{
    NSInteger fullStarCount = score / 20;
    BOOL hasHalfStar = (score % 20 > 10) ? YES : NO;
    if (fullStarCount == 0) {
        
        if (hasHalfStar) {
            _starImage1.image = [UIImage imageNamed:@"ic_rate_small_half"];
        } else {
            _starImage1.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        }
        _starImage2.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage3.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage4.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage5.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        
    } else if (fullStarCount == 1) {
        
        _starImage1.image = [UIImage imageNamed:@"ic_rate_small_full"];
        if (hasHalfStar) {
            _starImage2.image = [UIImage imageNamed:@"ic_rate_small_half"];
        } else {
            _starImage2.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        }
        _starImage3.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage4.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage5.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        
    } else if (fullStarCount == 2) {
        
        _starImage1.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage2.image = [UIImage imageNamed:@"ic_rate_small_full"];
        if (hasHalfStar) {
            _starImage3.image = [UIImage imageNamed:@"ic_rate_small_half"];
        } else {
            _starImage3.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        }
        _starImage4.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        _starImage5.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        
    } else if (fullStarCount == 3) {
        
        _starImage1.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage2.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage3.image = [UIImage imageNamed:@"ic_rate_small_full"];
        if (hasHalfStar) {
            _starImage4.image = [UIImage imageNamed:@"ic_rate_small_half"];
        } else {
            _starImage4.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        }
        _starImage5.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        
    } else if (fullStarCount == 4) {
        
        _starImage1.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage2.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage3.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage4.image = [UIImage imageNamed:@"ic_rate_small_full"];
        if (hasHalfStar) {
            _starImage5.image = [UIImage imageNamed:@"ic_rate_small_half"];
        } else {
            _starImage5.image = [UIImage imageNamed:@"ic_rate_small_empty"];
        }
        
    } else if (fullStarCount == 5) {
        _starImage1.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage2.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage3.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage4.image = [UIImage imageNamed:@"ic_rate_small_full"];
        _starImage5.image = [UIImage imageNamed:@"ic_rate_small_full"];
    }
}

@end
