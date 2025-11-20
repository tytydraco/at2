import { StyleSheet, View } from 'react-native';
import { useRef } from 'react';
import Rive, { Fit, RiveRef } from 'rive-react-native';

export default function Index() {
    const riveRef = useRef<RiveRef>(null);

    // Now you can access the Rive view model via riveRef.current

    return (
        <View style={styles.container}>
            <Rive
                ref={riveRef}
                source={require('../assets/input.riv')}
                autoplay={true}
                fit={Fit.Layout}
                layoutScaleFactor={1}
                style={styles.rive}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    },
    rive: {
        width: 400,
        height: 400,
    },
});
