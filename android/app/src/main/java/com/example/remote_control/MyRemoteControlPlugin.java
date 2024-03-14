package com.example.remote_control;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;
import androidx.annotation.NonNull;
import com.amazon.whisperlink.service.DeviceManager;
import com.connectsdk.device.ConnectableDevice;
import com.connectsdk.device.ConnectableDeviceListener;
import com.connectsdk.device.ConnectableDeviceListener;
import com.connectsdk.discovery.DiscoveryManager;
import com.connectsdk.discovery.DiscoveryManager.PairingLevel;
import com.connectsdk.discovery.DiscoveryManagerListener;
import com.connectsdk.service.DeviceService;
import com.connectsdk.service.DeviceService.PairingType;
import com.connectsdk.service.capability.ExternalInputControl;
import com.connectsdk.service.capability.KeyControl;
import com.connectsdk.service.capability.KeyControl.KeyCode;
import com.connectsdk.service.capability.Launcher;
import com.connectsdk.service.capability.MediaControl;
import com.connectsdk.service.capability.MediaPlayer;
import com.connectsdk.service.capability.MouseControl;
import com.connectsdk.service.capability.PowerControl;
import com.connectsdk.service.capability.TVControl;
import com.connectsdk.service.capability.TextInputControl;
import com.connectsdk.service.capability.ToastControl;
import com.connectsdk.service.capability.VolumeControl;
import com.connectsdk.service.capability.WebAppLauncher;
import com.connectsdk.service.capability.listeners.ResponseListener;
import com.connectsdk.service.command.ServiceCommandError;
import com.connectsdk.service.command.ServiceSubscription;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyRemoteControlPlugin implements FlutterPlugin, MethodCallHandler {

  private KeyControl keyControl;

  public KeyControl getKeyControl() {
    return keyControl;
  }

  private MediaControl mediaControl;

  public MediaControl getMediaControl() {
    return mediaControl;
  }

  private PowerControl powerControl;

  public PowerControl getPowerControl() {
    return powerControl;
  }

  private ConnectableDevice mTV;

  public ConnectableDevice getTv() {
    return mTV;
  }

  private TVControl tvControl;

  public TVControl getTVControl() {
    return tvControl;
  }

  private VolumeControl volumeControl;

  public VolumeControl getVolumeControl() {
    return volumeControl;
  }

  private MethodChannel channel;
  private Context pluginContext;

  private ServiceSubscription<VolumeControl.VolumeListener> mVolumeSubscription;

  private DiscoveryManager mDiscoveryManager;

  private ConnectableDeviceListener deviceListener = new ConnectableDeviceListener() {
    @Override
    public void onPairingRequired(
      ConnectableDevice device,
      DeviceService service,
      PairingType pairingType
    ) {
      Log.d("2ndScreenAPP", "Connected to " + mTV.getIpAddress());

      switch (pairingType) {
        case FIRST_SCREEN:
          Log.d("2ndScreenAPP", "First Screen");

          break;
        case PIN_CODE:
          channel.invokeMethod("onPairingRequired", null);
          break;
        case MIXED:
          Log.d("2ndScreenAPP", "Pin Code");

          break;
        case NONE:
        default:
          break;
      }
    }

    @Override
    public void onConnectionFailed(
      ConnectableDevice device,
      ServiceCommandError error
    ) {
      Log.d("2ndScreenAPP", "onConnectFailed");

    }

    @Override
    public void onDeviceReady(ConnectableDevice device) {
      Log.d("2ndScreenAPP", "onPairingDeviceReady");

      mTV.setPairingType(PairingType.MIXED);





      registerSuccess(mTV);

//      channel.invokeMethod("onPairingRequired", null);


    }

    @Override
    public void onDeviceDisconnected(ConnectableDevice device) {
      Log.d("2ndScreenAPP", "Device Disconnected");

    }

    @Override
    public void onCapabilityUpdated(
      ConnectableDevice device,
      List<String> added,
      List<String> removed
    ) {
      Log.d("2ndScreenAPP", "Device Disconnected");
    }
  };

  public void attachToEngine(Context context, FlutterEngine flutterEngine) {
    channel =
      new MethodChannel(
        flutterEngine.getDartExecutor().getBinaryMessenger(),
        "connectsdkMethodChannel"
      );
    channel.setMethodCallHandler(this);
    pluginContext = context;
  }

  @Override
  public void onAttachedToEngine(
    @NonNull FlutterPluginBinding flutterPluginBinding
  ) {
    Log.d("MyRemoteControlPlugin", "onAttachedToEngine");
    pluginContext = flutterPluginBinding.getApplicationContext();
  }

  public boolean initialize(Context context) {
    Log.d("MyRemoteControlPlugin", "initialized ");

    DiscoveryManager.init(context);
    mDiscoveryManager = DiscoveryManager.getInstance();
    mDiscoveryManager.registerDefaultDeviceTypes();
    mDiscoveryManager.setPairingLevel(DiscoveryManager.PairingLevel.ON);
    DiscoveryManager.getInstance().start();
    //    DiscoveryManager.getInstance().addListener(this);

    return true;
  }

  public void pairAlertDialog() {
    Log.d("MyRemoteControlPlugin", "pair code");
  }

  public void sendDirectionCommand() {}

  private VolumeControl.VolumeListener volumeListener = new VolumeControl.VolumeListener() {
    public void onSuccess(Float volume) {
      Log.d("MyRemoteControlPlugin", "volume");
    }

    @Override
    public void onError(ServiceCommandError error) {
      Log.d("MyRemoteControlPlugin", "Error subscribing to volume: " + error);
    }
  };

  public VolumeControl.VolumeListener getVolumeListener = new VolumeControl.VolumeListener() {
    @Override
    public void onError(ServiceCommandError error) {
      Log.d("MyRemoteControlPlugin", "Error getting Volume: " + error);
    }

    @Override
    public void onSuccess(Float object) {}
  };

  public void sendTVCommand(String commandString) {
    switch (commandString) {
      case "power_off":
        if (getTv().hasCapability(PowerControl.Off)) {
          getPowerControl().powerOff(null);
        }
        break;
      case "channel_up":
        if (getTv().hasCapabilities(TVControl.Channel_Up)) {
          getTVControl().channelUp(null);
        }
        break;
      case "channel_down":
        if (getTv().hasCapabilities(TVControl.Channel_Down)) {
          getTVControl().channelDown(null);
        }

        break;
      case "volume_down":
        getVolumeControl().volumeDown(null);
        break;
      case "volume_up":
        if (
          getTv().hasCapability(VolumeControl.Volume_Subscribe)
        ) mVolumeSubscription =
          getVolumeControl().subscribeVolume(volumeListener);



        if (getTv().hasCapability(VolumeControl.Volume_Subscribe)) {
          getVolumeControl().subscribeVolume(getVolumeListener);
        }

        if (getTv().hasCapability(VolumeControl.Volume_Get)) {
          getVolumeControl().getVolume(getVolumeListener);
        }
        getVolumeControl().volumeUp(null);
        break;
      case "go_right":
        if (getTv().hasCapability(KeyControl.Right)) {
          getKeyControl().right(null);
        }
        break;
      case "go_left":
        if (getTv().hasCapability(KeyControl.Left)) {
          getKeyControl().left(null);
        }
        break;
      case "home":
        if (getTv().hasCapabilities(KeyControl.Home)) {
          getKeyControl().home(null);
        }

        break;
      case "back":
        if (getTv().hasCapability(KeyControl.Back)) {
          getKeyControl().back(null);
        }

        break;
      case "ok":
        if (getTv().hasCapability(KeyControl.OK)) {
          getKeyControl().ok(null);
        }
        break;
      case "go_up":
        if (getTv().hasCapability(KeyControl.Up)) {
          getKeyControl().up(null);
        }
        break;
      case "go_down":
        if (getTv().hasCapability(KeyControl.Down)) {
          getKeyControl().down(null);
        }
        break;
      case "0":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_0, null);
        }

        break;
      case "1":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_1, null);
        }

        break;
      case "2":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_2, null);
        }

        break;
      case "3":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_3, null);
        }

        break;
      case "4":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_4, null);
        }

        break;
      case "5":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_5, null);
        }

        break;
      case "6":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_6, null);
        }

        break;
      case "7":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_7, null);
        }

        break;
      case "8":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_8, null);
        }

        break;
      case "9":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getKeyControl().sendKeyCode(KeyCode.NUM_9, null);
        }

        break;
      case "play":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getMediaControl().play(null);
        }

        break;
      case "pause":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getMediaControl().pause(null);
        }

        break;
      case "stop":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getMediaControl().stop(null);
        }

        break;
      case "rewind":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getMediaControl().rewind(null);
        }

        break;
      case "fastForward":
        if (getTv().hasAnyCapability(KeyControl.KeyCode)) {
          getMediaControl().fastForward(null);
        }

        break;
      case "mute":
        break;
    }
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "initialize":
        result.success(initialize(pluginContext));
        break;
      case "getAvailableDevices":
        result.success(getAvailableDevices());
        break;
      case "sendTVCommand":
        String command = call.argument("command");
        sendTVCommand(command);
        break;
      case "connectToDevice":
        String deviceId = call.argument("deviceId");


        result.success(connectToDevice(deviceId));
        break;
      case "sendKey":
        String key = call.argument("key");
        result.success(sendPairingKey(key));
        break;
      default:
        throw new IllegalArgumentException("Unknown method " + call.method);
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  // Method invoked from Flutter to initialize Connect SDK and start device discovery

  public boolean sendPairingKey(String key) {
    try{
       mTV.sendPairingKey(key);
       return true;
    }catch(Exception e){
      return false;
    }
   
    
  }

  public boolean connectToDevice(String deviceId) {
    Log.d("MyRemoteControlPlugin", deviceId);
    ConnectableDevice device = DiscoveryManager
      .getInstance()
      .getDeviceByIpAddress(deviceId);
    Log.d("MyRemoteControlPlugin", "device id " + device);

    if (device != null) {
      mTV = device;
      mTV.setPairingType(PairingType.MIXED);
      mTV.addListener(deviceListener);


  // Set the pairing type if needed
      mTV.connect();

//      mTV.addListener(deviceListener);
      //      this next line is not how to use this but it works so okay
//
//      registerSuccess(mTV);
      return true;
    } else {
      Log.e("MyRemoteControlPlugin", "Device not found with ID: " + deviceId);
    }
    return false;
  }

  public List<Map<String, Object>> getAvailableDevices() {
    Log.d("MyRemoteControlPlugin", "getAvailableDevices");

    List<Map<String, Object>> devicesList = new ArrayList<>();

    for (ConnectableDevice device : DiscoveryManager
      .getInstance()
      .getCompatibleDevices()
      .values()) {
      Map<String, Object> deviceMap = new HashMap<>();
      deviceMap.put("id", device.getId());
      deviceMap.put("ipAddress", device.getIpAddress());
      deviceMap.put("friendlyName", device.getFriendlyName());
      deviceMap.put("modelName", device.getModelName());
      deviceMap.put("modelNumber", device.getModelNumber());
      deviceMap.put("lastKnownIPAddress", device.getLastKnownIPAddress());
      deviceMap.put("lastSeenOnWifi", device.getLastSeenOnWifi());
      deviceMap.put("lastConnected", device.getLastConnected());
      deviceMap.put("lastDetection", device.getLastDetection());

      devicesList.add(deviceMap);
    }

    return devicesList;
  }

  public void registerSuccess(ConnectableDevice tv) {
    mTV = tv;

    if (tv == null) {
      //      launcher = null;
      //      mediaPlayer = null;
      mediaControl = null;
      tvControl = null;
      volumeControl = null;
      //      toastControl = null;
      //      textInputControl = null;
      //      mouseControl = null;
      //      externalInputControl = null;
      powerControl = null;
      keyControl = null;
      //      webAppLauncher = null;

      //      disableButtons();
    } else {
      //      launcher = mTv.getCapability(Launcher.class);
      //      mediaPlayer = mTv.getCapability(MediaPlayer.class);
      mediaControl = mTV.getCapability(MediaControl.class);
      tvControl = mTV.getCapability(TVControl.class);
      volumeControl = mTV.getCapability(VolumeControl.class);
      //      toastControl = mTv.getCapability(ToastControl.class);
      //      textInputControl = mTv.getCapability(TextInputControl.class);
      //      mouseControl = mTv.getCapability(MouseControl.class);
      //      externalInputControl = mTv.getCapability(ExternalInputControl.class);
      powerControl = mTV.getCapability(PowerControl.class);
      keyControl = mTV.getCapability(KeyControl.class);
      //      webAppLauncher = mTv.getCapability(WebAppLauncher.class);

      //      enableButtons();
    }
  }
}
