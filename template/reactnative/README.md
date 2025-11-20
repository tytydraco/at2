# React Native Template with Rive

This is a minimal [Expo](https://expo.dev) project with Rive integration.

## Important: Development Build Required

⚠️ **This project uses `rive-react-native`, which requires native code and does NOT work with Expo Go.**

You must create a **development build** to run this app. See instructions below.

## Get started

1. Install dependencies

   ```bash
   npm install
   ```

2. Create a development build

   **For iOS:**
   ```bash
   npx expo run:ios
   ```

   **For Android:**
   ```bash
   npx expo run:android
   ```

   This will build and install the native app with Rive support.

3. Start the development server

   ```bash
   npx expo start --dev-client
   ```

## Alternative: EAS Build

You can also create a development build using EAS:

```bash
# Install EAS CLI
npm install -g eas-cli

# Build for development
eas build --profile development --platform ios
# or
eas build --profile development --platform android
```

You can start developing by editing the files inside the **app** directory. This project uses [file-based routing](https://docs.expo.dev/router/introduction).

## Get a fresh project

When you're ready, run:

```bash
npm run reset-project
```

This command will move the starter code to the **app-example** directory and create a blank **app** directory where you can start developing.

## Learn more

To learn more about developing your project with Expo, look at the following resources:

- [Expo documentation](https://docs.expo.dev/): Learn fundamentals, or go into advanced topics with our [guides](https://docs.expo.dev/guides).
- [Learn Expo tutorial](https://docs.expo.dev/tutorial/introduction/): Follow a step-by-step tutorial where you'll create a project that runs on Android, iOS, and the web.

## Join the community

Join our community of developers creating universal apps.

- [Expo on GitHub](https://github.com/expo/expo): View our open source platform and contribute.
- [Discord community](https://chat.expo.dev): Chat with Expo users and ask questions.
