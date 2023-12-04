class Setting {
  late final String homeglobalbanner;
  late final String homeglobalyellowbanner;
  late final String banksglobalbanner;
  late final String banksglobalyellowbanner;
  late final String abovebankscard;
  late final String abovebankscardyellow;
  late final String enableratedialog;
  late final String abouttext;
  late final String dealingcaution;
  late final String displayviewscounter;
  late final String minandroidversion;

  Setting({
    required this.homeglobalbanner,
    required this.homeglobalyellowbanner,
    required this.banksglobalbanner,
    required this.banksglobalyellowbanner,
    required this.abovebankscard,
    required this.abovebankscardyellow,
    required this.enableratedialog,
    required this.abouttext,
    required this.dealingcaution,
    required this.displayviewscounter,
    required this.minandroidversion,
  });

  Setting.fromJson(Map<String, dynamic> json) {
    homeglobalbanner = json['home_global_banner'];
    homeglobalyellowbanner = json['home_global_yellow_banner'];
    banksglobalbanner = json['banks_global_banner'];
    banksglobalyellowbanner = json['banks_global_yellow_banner'];
    abovebankscard = json['above_banks_card'];
    abovebankscardyellow = json['above_banks_card_yellow'];
    enableratedialog = json['enable_rate_dialog'];
    abouttext = json['about_text'];
    dealingcaution = json['dealing_caution'];
    displayviewscounter = json['display_views_counter'];
    minandroidversion = json['min_android_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home_global_banner'] = homeglobalbanner;
    data['home_global_yellow_banner'] = homeglobalyellowbanner;
    data['banks_global_banner'] = banksglobalbanner;
    data['banks_global_yellow_banner'] = banksglobalyellowbanner;
    data['above_banks_card'] = abovebankscard;
    data['above_banks_card_yellow'] = abovebankscardyellow;
    data['enable_rate_dialog'] = enableratedialog;
    data['about_text'] = abouttext;
    data['dealing_caution'] = dealingcaution;
    data['display_views_counter'] = displayviewscounter;
    data['min_android_version'] = minandroidversion;
    return data;
  }
}
