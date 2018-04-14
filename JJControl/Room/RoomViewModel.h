//
//  RoomViewModel.h
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"
@class ROOM;
@interface RoomViewModel : BaseViewModel
-(void)fetchSceneData:(fetchBlock)block;
-(void)fetchDeviceData:(fetchBlock)block;
-(void)fetchConectData:(fetchBlock)block;
-(void)insertRoom:(ROOM*)room callback:(fetchBlock)block;
@end
