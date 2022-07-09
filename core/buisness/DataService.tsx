import {APIService} from '../data/APIService';
import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';
import {IDataService} from './IDataService';

export class DataService implements IDataService {
  getLatestCoffee(): Promise<Coffee> {
    return this.apiService.getAllCoffees().then(coffees => {
      return coffees[coffees.length - 1];
    });
  }
  apiService = new APIService();
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
  getSettingById(settingId: string): Setting {
    console.log(settingId);
    throw new Error('Method not implemented.');
  }
  getAllSettings(): Setting[] {
    throw new Error('Method not implemented.');
  }
  getBeanById(beanId: string): Bean {
    console.log(beanId);
    throw new Error('Method not implemented.');
  }
  getAllBeans(): Bean[] {
    throw new Error('Method not implemented.');
  }
  getRatingById(ratingId: string): Rating {
    console.log(ratingId);
    throw new Error('Method not implemented.');
  }
  getAllRatings(): Rating[] {
    throw new Error('Method not implemented.');
  }
  getUserById(userId: string): User {
    console.log(userId);
    throw new Error('Method not implemented.');
  }
  getAllUsers(): User[] {
    throw new Error('Method not implemented.');
  }
}
