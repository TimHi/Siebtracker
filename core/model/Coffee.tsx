export class Coffee {
  Id: string;
  SettingId: string;
  BeanId: string;
  RatingId: string;
  UserId: string;

  constructor(
    id: string,
    settingId: string,
    beanId: string,
    ratingId: string,
    userId: string,
  ) {
    this.Id = id;
    this.SettingId = settingId;
    this.BeanId = beanId;
    this.RatingId = ratingId;
    this.UserId = userId;
  }
}
