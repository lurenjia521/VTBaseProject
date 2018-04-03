//
//  BaseUserInfoModel.h
//  BaseProject
//
//  Created by lianjie on 2017/11/6.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface BaseUserInfoModel : BaseModel



/**
 {
 code = 0;
 data =     {
 birthday = "1968-12-7";
 cardNo = 650103198509141810;
 deptCode = 00010001;
 deptId = 17040614545700000111;
 deptName = "\U666e\U901a\U7528\U6237\U90e8\U95e8";
 deptParentName = "";
 depts =         (
 {
 area = 3081;
 deptCode = 00010001;
 deptId = 17040614545700000111;
 deptName = "\U666e\U901a\U7528\U6237\U90e8\U95e8";
 deptParent = 0000000013;
 deptType = dept;
 des = "\U62a4\U5de5\U7cfb\U7edf\U9884\U7f6e\U90e8\U95e8\U8bf7\U52ff\U5220\U9664";
 status = 0;
 systype = sys;
 }
 );
 device = "29E0FFBA-CB74-4288-BBD6-207F00B66872";
 deviceType = Simulator;
 idCardChecked = 1;
 mobile = 13572406964;
 roles =         (
 {
 roleId = 17042010232200000202;
 roleName = "\U5ba2\U6237\U624b\U673a\U7aef\U6ce8\U518c\U89d2\U8272";
 status = 0;
 },
 {
 regexp = jichu;
 roleId = 17040614584300000200;
 roleName = "\U666e\U901a\U7528\U6237\U89d2\U8272";
 status = 0;
 }
 );
 sex = WOMAN;
 userCode = 171202142436g59eO7G6;
 userId = 17120214244900000721;
 userImg = "/download/file/_2017_12_12_17121216004300003415.png";
 userName = gyvybybyvt;
 userType = 1;
 };
 msg = "";
 }

 
 */
///ID
@property (nonatomic ,copy) NSString *userId;
///用户账号
@property (nonatomic ,copy) NSString *userCode;
///姓名
@property (nonatomic ,copy) NSString *userName;
///手机号
@property (nonatomic ,copy) NSString *mobile;
///生日
@property (nonatomic ,copy) NSString *birthday;
///头像
@property (nonatomic ,copy) NSString *userImg;
///性别
@property (nonatomic ,copy) NSString *sex;
///用户类型
@property (nonatomic ,copy) NSString *userType;
///身份证号
@property (nonatomic ,copy) NSString *cardNo;
@property (nonatomic ,copy) NSString *telphone;
/**
 data: {[6]    (null)    @"cardNo" : @"650103198509141810"
 "userId": "1",
 "userCode": "admin",
 "userName": "管理员",
 "mobile": "13412341234",
 "birthday": "1980-01-01",
 "userImg": "/download/file/_2016_08_05_16080514101100001079.png",
 "sex": "MAN"
 }
 */

@end
