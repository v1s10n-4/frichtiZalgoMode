#define ZALGO_DOWN @[@"̖",@"̗",@"̘",@"̙",@"̜",@"̝",@"̞",@"̟",@"̠",@"̤",@"̥",@"̦",@"̩",@"̪",@"̫",@"̬",@"̭",@"̮",@"̯",@"̰",@"̱",@"̲",@"̳",@"̹",@"̺",@"̻",@"̼",@"ͅ",@"͇",@"͈",@"͉",@"͍",@"͎",@"͓",@"͔",@"͕",@"͖",@"͙",@"͚",@"̣"]
#define ZALGO_MID @[@"̕",@"̛",@"̀",@"́",@"͘",@"̡",@"̢",@"̧",@"̨",@"̴",@"̵",@"̶",@"͏",@"͜",@"͝",@"͞",@"͟",@"͠",@"͢",@"̸",@"̷",@"͡",@"҉"]
#define ZALGO_UP @[@"̍",@"̎",@"̄",@"̅",@"̿",@"̑",@"̆",@"̐",@"͒",@"͗",@"͑",@"̇",@"̈",@"̊",@"͂",@"̓",@"̈́",@"͊",@"͋",@"͌",@"̃",@"̂",@"̌",@"͐",@"̀",@"́",@"̋",@"̏",@"̒",@"̓",@"̔",@"̽",@"̉",@"ͣ",@"ͤ",@"ͥ",@"ͦ",@"ͧ",@"ͨ",@"ͩ",@"ͪ",@"ͫ",@"ͬ",@"ͭ",@"ͮ",@"ͯ",@"̾",@"͛",@"͆",@"̚"]

static NSString *randZalgo(NSArray *array) {
	return [array objectAtIndex: arc4random_uniform([array count])];
}

static NSString *zalgoString(NSString *string) {
	NSString *newstring = @"";
	BOOL isRand = 1;
	NSInteger labelzalgoUp = 4;
	NSInteger labelzalgoMid = 2;
	NSInteger labelzalgoDown = 4;	
	for (NSInteger i = 0; i < string.length; i++) {
		newstring = [newstring stringByAppendingString:[string substringWithRange:NSMakeRange(i, 1)]];
		NSInteger num_up = isRand ? arc4random_uniform(labelzalgoUp) : labelzalgoUp;
		NSInteger num_mid = isRand ? arc4random_uniform(labelzalgoMid) : labelzalgoMid;
		NSInteger num_down = isRand ? arc4random_uniform(labelzalgoDown) : labelzalgoDown;
		for (NSInteger j = 0; j < num_up; j++)
			newstring = [newstring stringByAppendingString:randZalgo(ZALGO_UP)];
		for (NSInteger j = 0; j < num_mid; j++)
			newstring = [newstring stringByAppendingString:randZalgo(ZALGO_MID)];
		for (NSInteger j = 0; j < num_down; j++)
			newstring = [newstring stringByAppendingString:randZalgo(ZALGO_DOWN)];
	}
	return newstring;
}

%hook UILabel

- (void)setText:(NSString *)text {
	%orig(zalgoString(text));
}

%end
