import {Colors, Typography} from 'react-native-ui-lib';
import {StyleSheet} from 'react-native';

export const styles = StyleSheet.create({});

Colors.loadColors({
  orange: '#ff6b1c',
  gold: '#FFD700',
  black: '#100D0D',
});

Typography.loadTypographies({
  h1: {fontSize: 30, fontWeight: '300', lineHeight: 46},
  h2: {fontSize: 24, fontWeight: '300', lineHeight: 32},
});
