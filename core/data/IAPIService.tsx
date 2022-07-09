import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';

export interface IAPIService {
  getCoffeeById(coffeeId: string): Promise<Coffee>;
  getAllCoffees(): Promise<Coffee[]>;

  getSettingById(settingId: string): Setting;
  getAllSettings(): Setting[];

  getBeanById(beanId: string): Bean;
  getAllBeans(): Bean[];

  getRatingById(ratingId: string): Rating;
  getAllRatings(): Rating[];

  getUserById(userId: string): User;
  getAllUsers(): User[];
}
