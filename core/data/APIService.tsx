import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';
import {IAPIService} from './IAPIService';

export class APIService implements IAPIService {
  getAllCoffees(): Promise<Coffee[]> {
    var apiUrl = 'http://localhost:10000/coffees/';
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        var coffeeList: Coffee[] = [];
        console.log('Result get all cofees:');
        //TODO: Fix warning
        res.forEach(coffeeJson => {
          coffeeList.push(
            new Coffee(
              coffeeJson.Id,
              coffeeJson.SettingId,
              coffeeJson.BeanId,
              coffeeJson.BeanId,
              coffeeJson.UserId,
            ),
          );
        });
        console.log(coffeeList);
        return coffeeList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting coffee from API');
      });
  }
  getCoffeeById(cofeeId: string): Promise<Coffee> {
    var apiUrl = `http://localhost:10000/coffees/${cofeeId}`;
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        return new Coffee(
          res.Id,
          res.SettingId,
          res.BeanId,
          res.RatingId,
          res.UserId,
        );
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting coffee from API');
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
