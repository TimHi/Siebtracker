import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';

export default function NewCoffeeScreen() {
  console.log('New Coffee');

  return (
    <SafeAreaView>
      <Text h1>New Coffee</Text>
    </SafeAreaView>
  );
}
