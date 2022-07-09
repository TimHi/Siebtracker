import React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import NewCoffeeScreen from '../../UI/screens/NewCoffeeScreen';
import StatisticsScreen from '../../UI/screens/StatisticsScreen';
import {SafeAreaProvider} from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/Ionicons';
import {HomeScreen} from '../../UI/screens/HomeScreen';

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
        screenOptions={({route}) => ({
          headerShown: false,
          tabBarIcon: ({focused, color, size}) => {
            let iconName;

            if (route.name === 'Home') {
              iconName = focused ? 'home' : 'home-outline';
            } else if (route.name === 'NewCoffee') {
              iconName = focused ? 'grid' : 'grid-outline';
            } else if (route.name === 'Statistics') {
              iconName = focused ? 'md-cart' : 'md-cart-outline';
            }

            return <Icon name={iconName} size={size} color={color} />;
          },
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
