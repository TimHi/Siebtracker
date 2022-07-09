import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';

export interface IDataService {
  getCoffeeById(coffeeId: string): Promise<Coffee>;
  getAllCoffees(): Promise<Coffee[]>;
  getLatestCoffee(): Promise<Coffee>;

  getSettingById(settingId: string): Promise<Setting>;
  getAllSettings(): Promise<Setting[]>;

  getBeanById(beanId: string): Promise<Bean>;
  getAllBeans(): Promise<Bean[]>;

  getRatingById(ratingId: string): Promise<Rating>;
  getAllRatings(): Promise<Rating[]>;

  getUserById(userId: string): Promise<User>;
  getAllUsers(): Promise<User[]>;
}
