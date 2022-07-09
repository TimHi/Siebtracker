import {APIService} from '../data/APIService';
import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';
import {IDataService} from './IDataService';

export class DataService implements IDataService {
  apiService = new APIService();
  getSettingById(settingId: string): Promise<Setting> {
    return this.apiService.getSettingById(settingId).then(setting => {
      return setting;
    });
  }
  getAllSettings(): Promise<Setting[]> {
    return this.apiService.getAllSettings().then(settings => {
      return settings;
    });
  }
  getBeanById(beanId: string): Promise<Bean> {
    return this.apiService.getBeanById(beanId).then(bean => {
      return bean;
    });
  }
  getAllBeans(): Promise<Bean[]> {
    return this.apiService.getAllBeans().then(beans => {
      return beans;
    });
  }
  getRatingById(ratingId: string): Promise<Rating> {
    return this.apiService.getRatingById(ratingId).then(rating => {
      return rating;
    });
  }
  getAllRatings(): Promise<Rating[]> {
    return this.apiService.getAllRatings().then(rating => {
      return rating;
    });
  }
  getUserById(userId: string): Promise<User> {
    return this.apiService.getUserById(userId).then(user => {
      return user;
    });
  }
  getAllUsers(): Promise<User[]> {
    return this.apiService.getAllUsers().then(users => {
      return users;
    });
  }
  getLatestCoffee(): Promise<Coffee> {
    return this.apiService.getAllCoffees().then(coffees => {
      return coffees[coffees.length - 1];
    });
  }
  getCoffeeById(coffeeId: string): Promise<Coffee> {
    return this.apiService.getCoffeeById(coffeeId).then(coffee => {
      return coffee;
    });
  }
  getAllCoffees(): Promise<Coffee[]> {
    return this.apiService.getAllCoffees().then(coffees => {
      return coffees;
    });
  }
}
