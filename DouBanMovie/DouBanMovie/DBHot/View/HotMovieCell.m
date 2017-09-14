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
    
    [_afficheImageView sd_setImageWithURL:[NSURL URLWithString:_model.images.small]];
    _nameLabel.text = _model.title;
    _ratingLabel.text = _model.rating.average;
    if (_model.directors.count) {
        SubjectDirector *director = _model.directors.firstObject;
        _directorLabel.text = [NSString stringWithFormat:@"导演: %@", director.name];
    }
    
    NSMutableString *actor = [NSMutableString string];
    for (NSInteger i = 0; i < _model.casts.count; i++) {
        SubjectDirector *cast = _model.casts[i];
        [actor appendFormat:@"%@/",cast.name];
    }
    if (actor.length > 0) {
        [actor replaceCharactersInRange:NSMakeRange(actor.length - 1, 1) withString:@""];
    }
    _actorLabel.text = [NSString stringWithFormat:@"主演: %@", actor];
    
    if ([_model.has_video boolValue]) {
        
        _payButton.layer.borderWidth = 1.0;
        _payButton.layer.borderColor = [UIColor blueColor].CGColor;
        [_payButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_payButton setTitle:@"购票" forState:UIControlStateNormal];
        _seenLabel.text = [NSString stringWithFormat:@"%@人看过", _model.collect_count];
    } else {
    
        _payButton.layer.borderWidth = 1.0;
        _payButton.layer.borderColor = [UIColor orangeColor].CGColor;
        [_payButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_payButton setTitle:@"预售" forState:UIControlStateNormal];
        _seenLabel.text = [NSString stringWithFormat:@"%@人想看", _model.collect_count];
    }
    
    // 评分✨
    NSInteger ratingAverage = (NSInteger)([_model.rating.average floatValue] * 10);
    
    NSInteger fullStarCount = ratingAverage / 20;
    BOOL hasHalfStar = (ratingAverage % 20 > 10) ? YES : NO;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
