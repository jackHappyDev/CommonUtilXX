//
//  PTConfigModel.h
//  PlatformTop
//
//  Created by Colin on 03/01/2020.
//  Copyright © 2020 liuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface ImageColor : NSObject

@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * color;

@end

@interface ColorCommonModel : NSObject

@property (nonatomic, strong) ImageColor * imageColor;
@property (nonatomic, strong) NSString * borderColor;
@property (nonatomic, strong) NSString * cellBGColor1;
@property (nonatomic, strong) NSString * cellBGColor2;
@property (nonatomic, strong) NSString * lineColor39;
@property (nonatomic, strong) NSString * lineColor28;
@property (nonatomic, strong) NSString * lineColor24;
@property (nonatomic, strong) NSString * placeHolderColor;
@property (nonatomic, strong) NSString * topTextColor;
@property (nonatomic, strong) NSString * topBGColor;
@property (nonatomic, strong) NSString * listNormalColor;
@property (nonatomic, strong) NSString * normalTextColor;
@property (nonatomic, strong) NSString * desColor;
@property (nonatomic, strong) NSString * mainColor;

@end

@interface ColorHomeModel : NSObject
@property (nonatomic, strong) NSString * noticeTextColor;
@property (nonatomic, strong) NSString * homeTopBalanceTextColor;
@property (nonatomic, strong) NSString * homeTopBtnTitleColor;
@property (nonatomic, strong) NSString * WIFIWellColor;
@property (nonatomic, strong) NSString * WIFINormalColor;
@property (nonatomic, strong) NSString * WIFIBadColor;

@end

@interface ColorUserModel : NSObject
@property (nonatomic, strong) NSArray  * userBGColors;
@property (nonatomic, strong) NSString * avaterBorderColor;
@property (nonatomic, strong) NSString * userTipTextColor;
@property (nonatomic, strong) NSString * userTipShadowColor;
@property (nonatomic, strong) NSString * userValueTextColor;
@property (nonatomic, strong) NSString * userBtnTitleColor;
@property (nonatomic, strong) NSString * userTopTitleSelectColor;
@property (nonatomic, strong) NSString * userTopTitleNormalColor;
@property (nonatomic, strong) NSString * userHeaderViewBGColor;
@property (nonatomic, strong) NSString * userListNormalTextColor;
@property (nonatomic, strong) NSString * lastBottomLineColor;
@property (nonatomic, strong) NSString * userHeaderBGColor;
@property (nonatomic, strong) NSString * modifyPlaceHolderColor;
@property (nonatomic, strong) NSString * userPickerBtnTitleColor;
@property (nonatomic, strong) NSString * userPickerTopBGColor;
@property (nonatomic, strong) NSString * userHistoryBGView;
@property (nonatomic, strong) NSString * userStateTimeTextColor;
@property (nonatomic, strong) NSString * rebateAmountTotalTextColor;
@property (nonatomic, strong) NSArray  * userStateTopViewColor;
@property (nonatomic, strong) NSString * userStateTipTextColor;
@property (nonatomic, strong) NSString * userBalanceCellColor2;
@property (nonatomic, strong) NSString * userBalanceCellColor3;
@property (nonatomic, strong) NSString * userBalanceCellColor4;
@property (nonatomic, strong) NSString * userBetMoneyTextColor;
@property (nonatomic, strong) NSString * userStatusTextColor;
@property (nonatomic, strong) NSString * userBotLastBGView;
@property (nonatomic, strong) NSString * userWithdrawTextColor;
@property (nonatomic, strong) NSString * userFundDetaileWithDrawTextColor;
@property (nonatomic, strong) NSString * userFundDetaileBalanceTextColor;
@property (nonatomic, strong) NSString * userLevelCellTipTextColor;

@end

@interface ColorRegisterModel : NSObject
@property (nonatomic, strong) NSString * regSendCodeTextColor;
@property (nonatomic, strong) NSString * signForgetColor;
@property (nonatomic, strong) NSString * countdownBtnTextColor;
@end

@interface ColorVIPInfoModel : NSObject
@property (nonatomic, strong) NSString * vipHeaderBGColor;
@property (nonatomic, strong) NSString * vipTextColor;
@property (nonatomic, strong) NSString * tipTextColor;
@property (nonatomic, strong) NSString * vipNextNormalColor;
@property (nonatomic, strong) NSString * vipHeaderLabelBGColor;
@end

@interface ColorActivityModel : NSObject
@property (nonatomic, strong) NSString * signMoneyLabelShadowColor;
@property (nonatomic, strong) NSString * activityDetailViewBGColor;
@property (nonatomic, strong) NSString * activityDetailViewBorderColor;
@property (nonatomic, strong) NSString * activitySignDoneColor;
@property (nonatomic, strong) NSString * activityTodayTitleColor;
@property (nonatomic, strong) NSString * activitiFontColor;
@property (nonatomic, strong) NSString * activitiHTMLBGColor;
@property (nonatomic, strong) NSString * activitiDetailFontColor;
@property (nonatomic, strong) NSString * activitiDetailHtmlBGColor;
@end

@interface ColorSafeModel : NSObject
@property (nonatomic, strong) NSString * safeDetailDateColor;
@property (nonatomic, strong) NSString * safeInColor;
@property (nonatomic, strong) NSString * safeOutColor;
@property (nonatomic, strong) NSString * safePasswordBtnColor;
@property (nonatomic, strong) NSString * safePresentTextColor;
@property (nonatomic, strong) NSString * safePasswordBGColor;
@end

@interface ColorAgentModel : NSObject
@property (nonatomic, strong) NSString * agentLabelBGColor;
@property (nonatomic, strong) NSString * agentLabelLeftColor;
@property (nonatomic, strong) NSString * agentLabelTipColor;
@property (nonatomic, strong) NSString * drectlyTopNumTipColor;
@property (nonatomic, strong) NSString * drectlyTopBGColor;
@property (nonatomic, strong) NSString * drectlyHeaderTextColor;
@property (nonatomic, strong) NSString * drectlyTextFieldBGColor;
@property (nonatomic, strong) NSString * drectlyBtnTitleColor;
@property (nonatomic, strong) NSString * performListColor2;
@property (nonatomic, strong) NSString * performListColor3;
@property (nonatomic, strong) NSString * agentCellTextColor2;
@property (nonatomic, strong) NSString * agentCellTextColor3;
@property (nonatomic, strong) NSString * agentCellTopAndBottom;
@property (nonatomic, strong) NSString * agentCellDefault;
@property (nonatomic, strong) NSString * agentBottomTextColor;
@property (nonatomic, strong) NSString * agentReturnListLineColor;
@property (nonatomic, strong) NSString * agentReturnListAmantColor;
@property (nonatomic, strong) NSArray  * agentReturnCellBGCell;
@property (nonatomic, strong) NSString * agentReturnCellAmantColor;
@property (nonatomic, strong) NSString * agentShareBGColor;
@property (nonatomic, strong) NSString * agentShareTextColor;
@property (nonatomic, strong) NSString * agentRefreshTipColor;
@property (nonatomic, strong) NSString * performBtnTitleColor;
@property (nonatomic, strong) NSString * agentLQBtnTitleColor;
@end

@interface ColorSettingModel : NSObject
@property (nonatomic, strong) NSString * forgetLeftTextColor;
@property (nonatomic, strong) NSString * sendCodeBtnTitleColor;
@property (nonatomic, strong) NSString * voiceTipTextColor;
@property (nonatomic, strong) NSArray  * voiceBGColor;
@property (nonatomic, strong) NSString * pawTipTextColor;
@property (nonatomic, strong) NSString * updateTipTextColor;

@end

@interface ColorMessageModel : NSObject
@property (nonatomic, strong) NSString * messageTitleNormalTextColor;
@property (nonatomic, strong) NSString * messageDateTextColor;
@property (nonatomic, strong) NSString * messageShowBtnTitleNormalColor;
@property (nonatomic, strong) NSString * messageTitleIsReadTextColor;
@property (nonatomic, strong) NSString * messageShowBtnTitleIsReadColor;
@property (nonatomic, strong) NSString * massageBotBGColor;
@property (nonatomic, strong) NSString * messageBotBorderColor;

@end

@interface ColorPayModel : NSObject
@property (nonatomic, strong) NSArray  * payBindBankCardBGView;
@property (nonatomic, strong) NSString * payBindBCTopTextColor;
@property (nonatomic, strong) NSString * cardListTopTextColor;
@property (nonatomic, strong) NSString * cardListBGViewColor;
@property (nonatomic, strong) NSString * rechargeCellTextColorDefault;
@property (nonatomic, strong) NSString * rechargeCellTextColor2;
@property (nonatomic, strong) NSString * rechargeCellTextColor3;
@property (nonatomic, strong) NSString * rechargeDetailConnectColor;
@property (nonatomic, strong) NSString * statusSuccessColor;
@property (nonatomic, strong) NSString * statusFailureColor;
@property (nonatomic, strong) NSString * statusWaitColor;
@property (nonatomic, strong) NSString * statusReturnColor;
@property (nonatomic, strong) NSString * rechargeMoneyColor;
@property (nonatomic, strong) NSString * rechargeCopyTitleColor;
@property (nonatomic, strong) ImageColor * rechargeCellNormalTextColor;
@property (nonatomic, strong) NSString * rechargeCellSelectTextColor;
@property (nonatomic, strong) NSString * payTipTextColor;
@property (nonatomic, strong) NSArray  * rechareServerBGColor;
@property (nonatomic, strong) NSString * rechareServerBorderColor;
@property (nonatomic, strong) NSString * rechargeSupportTextColor;
@property (nonatomic, strong) NSString * rechargeMethodTextColor;
@property (nonatomic, strong) NSString * rechargeServerShowViewBGColor;
@property (nonatomic, strong) NSString * rechargeServerShowBorderColor;
@property (nonatomic, strong) NSString * rechargeServerTitleColor;
@property (nonatomic, strong) NSArray  * rechargeCoinShowViewBGColor;
@property (nonatomic, strong) NSString * rechargeCoinTitleColor;
@property (nonatomic, strong) NSString * rechargeCoinMoneyColor;
@property (nonatomic, strong) NSArray  * rechargeBottomInputBGColor;
@property (nonatomic, strong) NSString * rechargeBottomBorderColor;
@property (nonatomic, strong) NSString * rechargeThirdPayTipTextColor;
@property (nonatomic, strong) NSString * rechargeTextColor;
@property (nonatomic, strong) NSString * rechargeInfoColor;
@property (nonatomic, strong) NSArray  * rechargeBottomOperationColor;
@property (nonatomic, strong) NSArray  * rechargeCodeViewBGColor;
@property (nonatomic, strong) NSArray  * rechargeTeachTextColor;
@property (nonatomic, strong) NSArray  * rechargeVipBorderColor;
@property (nonatomic, strong) NSArray  * rechargeVipBGColor;
@property (nonatomic, strong) NSArray  * rechargeThridBorderColor;
@property (nonatomic, strong) NSArray  * rechargeThridBGColor;
@property (nonatomic, strong) NSString * payeeCloudTextColor;
@property (nonatomic, strong) NSString * payeeWXTextColor;
@property (nonatomic, strong) NSString * payeeAliTextColor;
@end

@interface ColorWashCodeModel : NSObject
@property (nonatomic, strong) NSArray  * washcodeBGColor;
@property (nonatomic, strong) NSString * washcodeTextColor;
@property (nonatomic, strong) NSString * washcodeBtnTitleColor;
@property (nonatomic, strong) NSString * washcodeLastTimeColor;
@property (nonatomic, strong) NSString * washcodeLastTimeValueColor;
@property (nonatomic, strong) NSString * washcodeHeaderBGColor;
@property (nonatomic, strong) NSString * washcodeHeaderTipBGColor;
@property (nonatomic, strong) NSString * washcodeHeaderTipTextColor;
@property (nonatomic, strong) NSString * washcodeTitleTextColor;
@property (nonatomic, strong) NSString * washcodeTitleBGColor;
@property (nonatomic, strong) NSString * washcodeListBtnTitleColor;
@property (nonatomic, strong) NSString * washcodeDetailLabelColor0;
@property (nonatomic, strong) NSArray  * washcodeHistoryCellBGColor;
@property (nonatomic, strong) NSString * washcodeHistoryBGColor;
@property (nonatomic, strong) NSString * washcodeCellTextColor2;
@property (nonatomic, strong) NSArray  * washcodeMeJBColor;
@property (nonatomic, strong) NSString * washcodeMeBGColor;

@end

@interface ColorServiceModel : NSObject
@property (nonatomic, strong) NSString * serviceListAvatarBGColor;
@property (nonatomic, strong) NSString * serviceOnlineTopTextColor;
@property (nonatomic, strong) ImageColor * serviceNumberTextColor;
@property (nonatomic, strong) NSString * serviceWorkTextColor;

@end

@interface ColorWithdrawModel : NSObject
@property (nonatomic, strong) NSString * withdrawHistoryBtnTitleColor;
@property (nonatomic, strong) NSString * withdrawBalanceBtnTitleColor;
@property (nonatomic, strong) NSString * withdrawBankTextColor;
@property (nonatomic, strong) NSString * withdrawBankTipTextColor;
@property (nonatomic, strong) NSString * withdrawHistoryCellColor4;
@property (nonatomic, strong) NSString * withdrawHistoryCellColor5;
@property (nonatomic, strong) NSString * withdrawTopTextColor;
@property (nonatomic, strong) NSString * withdrawBankRightBtnHistoryColor;
@property (nonatomic, strong) NSString * withdrawRightViewBGColor;
@property (nonatomic, strong) NSString * withdrawTextFieldBGColor;
@property (nonatomic, strong) NSString * withdrawPlaceHolderColor;
@property (nonatomic, strong) NSString * withdrawBankListCellAcountColor;
@end

@interface ColorAlertViewModel : NSObject
@property (nonatomic, strong) NSArray  * currentBGColors;
@property (nonatomic, strong) NSString * currentTextColor;
@property (nonatomic, strong) NSString * defaultColor;
@property (nonatomic, strong) NSString * defaultTextColor;
@property (nonatomic, strong) NSString * alertCellTextColor;
@property (nonatomic, strong) NSString * alertCellBGColor;
@property (nonatomic, strong) NSString * contentTextColor;
@end

@interface ColorLeftViewModel : NSObject
@property (nonatomic, strong) NSString * leftViewItemSelectTextColor;
@end

@interface PTColorConfigModel : NSObject
@property (nonatomic, strong)ColorCommonModel   * Common;
@property (nonatomic, strong)ColorHomeModel     * Home;
@property (nonatomic, strong)ColorUserModel     * User;
@property (nonatomic, strong)ColorVIPInfoModel  * VIPInfo;
@property (nonatomic, strong)ColorRegisterModel * Register;
@property (nonatomic, strong)ColorActivityModel * Activity;
@property (nonatomic, strong)ColorSafeModel     * Safe;
@property (nonatomic, strong)ColorAgentModel    * Agent;
@property (nonatomic, strong)ColorSettingModel  * Setting;
@property (nonatomic, strong)ColorMessageModel  * Message;
@property (nonatomic, strong)ColorPayModel      * Pay;
@property (nonatomic, strong)ColorWashCodeModel * WashCode;
@property (nonatomic, strong)ColorServiceModel  * Service;
@property (nonatomic, strong)ColorWithdrawModel * Withdraw;
@property (nonatomic, strong)ColorAlertViewModel* AlertView;
@property (nonatomic, strong)ColorLeftViewModel * LeftView;


+(instancetype)shareConfigModel;

@end

NS_ASSUME_NONNULL_END
