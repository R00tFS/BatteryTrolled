#import "Tweak.h"

static BOOL enabled = true;
static NSString *overwriteBy = nil;

%group Hooks
%hook PSTableCell
-(void) didMoveToWindow {
	

	if ([self.textLabel.text isEqualToString:@"Maximum Capacity"]) {
		self.detailTextLabel.text = overwriteBy;
	}
	%orig;
	
}

%end
%end

void loadPreferences() {
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"fr.bibifire.batterytrolledprefs"];

	enabled = (prefs && [prefs objectForKey:@"enabled"] ? [[prefs valueForKey:@"enabled"] boolValue] : YES );
	overwriteBy = [prefs objectForKey:@"overwriteBy"];
}

%ctor {
	loadPreferences();
	
	if (enabled) {
		%init(Hooks);
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("fr.bibifire.batterytrolled-prefs-updated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	} 
}
