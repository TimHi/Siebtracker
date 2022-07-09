import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';
import {DataService} from '../../core/buisness/DataService';
import {Coffee} from '../../core/model/Coffee';
import {Rating} from '../../core/model/Rating';
import {ExtractedCoffeeCard} from '../components/ExtracedCoffeeCard';

interface IHomeScreenState {
  lastCoffee: Coffee;
  lastRating: Rating;
}

interface IHomeScreenProps {}

export class HomeScreen extends React.Component<
  IHomeScreenProps,
  IHomeScreenState
> {
  dataService = new DataService();
  constructor(props: IHomeScreenProps) {
    super(props);
    this.state = {
      lastCoffee: new Coffee('', '', '', '', ''),
      lastRating: new Rating('', '', '', '', ''),
    };
  }

  componentDidMount() {
    this.dataService
      .getLatestCoffee()
      .then(coffee => {
        this.setState({
          lastCoffee: coffee,
        });
      })
      .then(() => {
        this.dataService
          .getRatingById(this.state.lastCoffee.RatingId)
          .then(rating => {
            this.setState({
              lastRating: rating,
            });
            console.log('Fetched Rating: ');
            console.log(rating);
          });
      });
  }

  render() {
    return (
      <SafeAreaView>
        <Text h1>Last Coffee:</Text>
        <ExtractedCoffeeCard
          coffee={this.state.lastCoffee}
          rating={this.state.lastRating}
        />
      </SafeAreaView>
    );
  }
}
