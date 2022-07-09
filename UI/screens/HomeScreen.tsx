import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';
import {DataService} from '../../core/buisness/DataService';
import {Coffee} from '../../core/model/Coffee';

interface IHomeScreenState {
  lastCoffee: Coffee;
}

interface IHomeScreenProps {}

export class HomeScreen extends React.Component<
  IHomeScreenProps,
  IHomeScreenState
> {
  dataService = new DataService();
  constructor(props: IHomeScreenProps) {
    super(props);
    this.state = {lastCoffee: new Coffee('', '', '', '', '')};
  }

  componentDidMount() {
    this.dataService.getLatestCoffee().then(c => {
      this.setState({
        lastCoffee: c,
      });
    });
  }

  render() {
    return (
      <SafeAreaView>
        <Text h1>Home</Text>
        <Text>{this.state.lastCoffee.Id}</Text>
      </SafeAreaView>
    );
  }
}
