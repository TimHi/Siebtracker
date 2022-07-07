import React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import HomeScreen from '../../UI/screens/HomeScreen';
import NewCoffeeScreen from '../../UI/screens/NewCoffeeScreen';
import StatisticsScreen from '../../UI/screens/StatisticsScreen';
import {SafeAreaProvider} from 'react-native-safe-area-context';

export type BottomTabStackParams = {
  Home: undefined;
  NewCoffee: undefined;
  Statistics: undefined;
};
const BottomTabStack = createBottomTabNavigator<BottomTabStackParams>();

export default function BottomTabNavigator() {
  return (
    <SafeAreaProvider>
      <BottomTabStack.Navigator
        screenOptions={() => ({
          headerShown: false,

          tabBarActiveTintColor: 'tomato',
          tabBarInactiveTintColor: 'gray',
        })}>
        <BottomTabStack.Screen name="Home" component={HomeScreen} />
        <BottomTabStack.Screen name="NewCoffee" component={NewCoffeeScreen} />
        <BottomTabStack.Screen name="Statistics" component={StatisticsScreen} />
      </BottomTabStack.Navigator>
    </SafeAreaProvider>
  );
}
