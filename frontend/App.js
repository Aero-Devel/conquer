import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { useFonts } from 'expo-font';
import { Colors } from 'react-native/Libraries/NewAppScreen';

export default function App() {

  /*
  Fonts 
   */
  const [loaded] = useFonts({
    Montserrat: require('./assets/fonts/Montserrat.ttf'),
    SansitaBlack: require('./assets/fonts/Sansita-Black.ttf'),
    SansitaIt: require('./assets/fonts/Sansita-Italic.ttf'),
    SansitaReg: require('./assets/fonts/ScopeOne-Regular.ttf'),
    Shrikhand: require('./assets/fonts/Shrikhand-Regular.ttf'),
    ScopeOneReg: require('./assets/fonts/Shrikhand-Regular.ttf'),
  });
    if (!loaded) {
    return null;
  }




  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={[styles.standard, styles.container]}>Vad händer</Text>
    </View>
  );
}


//  <Text style={ [styles.red, styles.bigBlue] }

const styles = StyleSheet.create({
  standard:{
   fontFamily: 'SansitaBlack', 
   fontSize: 44,
   color: 'red'
  },
  container: {
    marginTop: 50,
  },
  bigBlue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});