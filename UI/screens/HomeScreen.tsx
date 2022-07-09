import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';
import {DataService} from '../../core/services/DataService';

export class HomeScreen extends React.Component {
  dataService = new DataService();

  componentDidMount() {
    var coffees = this.dataService.getAllCoffees();
    console.log(coffees);
  }

  render() {
    return (
      <SafeAreaView>
        <Text h1>Home</Text>
      </SafeAreaView>
    );
  }
}
