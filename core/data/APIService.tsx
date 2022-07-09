import {Bean} from '../model/Bean';
import {Coffee} from '../model/Coffee';
import {Rating} from '../model/Rating';
import {Setting} from '../model/Setting';
import {User} from '../model/User';
import {IAPIService} from './IAPIService';

export class APIService implements IAPIService {
  getSettingById(settingId: string): Promise<Setting> {
    var apiUrl = `http://localhost:10000/settings/${settingId}`;
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        return new Setting(
          res.Id,
          res.Ratio,
          res.ExtractionTime,
          res.CoarseWeight,
          res.ExtractedWeight,
        );
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting coffee from API');
      });
  }
  getAllSettings(): Promise<Setting[]> {
    var apiUrl = 'http://localhost:10000/settings/';
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        var settingList: Setting[] = [];
        //TODO: Fix warning
        res.forEach(settingJson => {
          settingList.push(
            new Setting(
              settingJson.Id,
              settingJson.Ratio,
              settingJson.ExtractionTime,
              settingJson.CoarseWeight,
              settingJson.ExtractedWeight,
            ),
          );
        });
        return settingList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting Ratings from API');
      });
  }
  getBeanById(beanId: string): Promise<Bean> {
    var apiUrl = `http://localhost:10000/beans/${beanId}`;
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        return new Bean(res.Id, res.Title, res.Desc, res.Producer, res.Image);
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting coffee from API');
      });
  }
  getAllBeans(): Promise<Bean[]> {
    var apiUrl = 'http://localhost:10000/beans/';
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        var beanList: Bean[] = [];
        //TODO: Fix warning
        res.forEach(beanJson => {
          beanList.push(
            new Bean(
              beanJson.Id,
              beanJson.Title,
              beanJson.Desc,
              beanJson.Producer,
              beanJson.Image,
            ),
          );
        });
        return beanList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting Ratings from API');
      });
  }
  getRatingById(ratingId: string): Promise<Rating> {
    var apiUrl = `http://localhost:10000/ratings/${ratingId}`;
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        return new Rating(
          res.Id,
          res.Body,
          res.Taste,
          res.Bitterness,
          res.Sourness,
        );
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting coffee from API');
      });
  }
  getAllRatings(): Promise<Rating[]> {
    var apiUrl = 'http://localhost:10000/ratings/';
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        var ratingList: Rating[] = [];
        //TODO: Fix warning
        res.forEach(ratingJson => {
          ratingList.push(
            new Rating(
              ratingJson.Id,
              ratingJson.Body,
              ratingJson.Taste,
              ratingJson.Bittnerness,
              ratingJson.Sourness,
            ),
          );
        });
        return ratingList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting Ratings from API');
      });
  }
  getUserById(userId: string): Promise<User> {
    var apiUrl = `http://localhost:10000/users/${userId}`;
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        return new User(res.Id, res.Name, res.Image);
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting User from API');
      });
  }
  getAllUsers(): Promise<User[]> {
    var apiUrl = 'http://localhost:10000/users/';
    return fetch(apiUrl)
      .then(res => res.json())
      .then(res => {
        var userList: User[] = [];
        //TODO: Fix warning
        res.forEach(userJson => {
          userList.push(new User(userJson.Id, userJson.Name, userJson.Image));
        });
        return userList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting Users from API');
      });
  }
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
              coffeeJson.RatingId,
              coffeeJson.UserId,
            ),
          );
        });
        console.log(coffeeList);
        return coffeeList;
      })
      .catch(error => {
        console.log(error);
        throw Error('Error getting Coffees from API');
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
        throw Error('Error getting Coffee from API');
      });
  }
}
