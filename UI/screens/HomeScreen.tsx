import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';

export default function HomeScreen() {
  console.log('Home');
  return (
    <SafeAreaView>
      <Text h1>Home</Text>
    </SafeAreaView>
  );
}
