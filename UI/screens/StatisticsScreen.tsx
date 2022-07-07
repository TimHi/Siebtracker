import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Text} from 'react-native-ui-lib';

export default function StatisticsScreen() {
  console.log('Stats');
  return (
    <SafeAreaView>
      <Text h1>Stats</Text>
    </SafeAreaView>
  );
}
