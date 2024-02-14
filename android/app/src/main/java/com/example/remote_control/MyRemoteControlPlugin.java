package com.example.remote_control;

import android.content.Context;
import com.connectsdk.device.ConnectableDevice;
import com.connectsdk.device.ConnectableDeviceListener;
import com.connectsdk.discovery.DiscoveryManager;
import com.connectsdk.discovery.DiscoveryManager.PairingLevel;
import com.connectsdk.service.DeviceService;
import com.connectsdk.service.DeviceService.PairingType;
import com.connectsdk.service.command.ServiceCommandError;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.util.Log;

public class MyRemoteControlPlugin implements ConnectableDeviceListener, FlutterPlugin, MethodCallHandler {

    private ConnectableDevice mTV;
    private MethodChannel channel;
    private Context pluginContext; 

    public void attachToEngine(Context context, FlutterEngine flutterEngine) {
        Log.d("MyRemoteControlPlugin", "attachToEngine");
        channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "connectsdkMethodChannel");
        channel.setMethodCallHandler(this);
        pluginContext = context;
        Log.d("MyRemoteControlPlugin", "attachToEngine: success");
    }
    public void attachToEngine(Context context, FlutterEngine flutterEngine) {
        Log.d("MyRemoteControlPlugin", "attachToEngine");
        channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "connectsdkMethodChannel");
        channel.setMethodCallHandler(this);
        pluginContext = context;
        Log.d("MyRemoteControlPlugin", "attachToEngine: success");
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        Log.d("MyRemoteControlPlugin", "onAttachedToEngine");
        Log.d("MyRemoteControlPlugin", "onAttachedToEngine");
        pluginContext = flutterPluginBinding.getApplicationContext();
    }

    public boolean initialize(Context context) {
        DiscoveryManager.init(context);
        DiscoveryManager.getInstance().registerDefaultDeviceTypes();
        DiscoveryManager.getInstance().setPairingLevel(PairingLevel.ON);
        DiscoveryManager.getInstance().start();
        
        return true; 
        }


    public void pairAlertDialog(){

    }
    public void pairCodeDialog(){}

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method){
            case "initialize":
                result.success(initialize(pluginContext));
             break;
            case "getAvailableDevices":
                result.success(getAvailableDevices());
            break;
            case "connectToDevice":
                String deviceId = call.argument("deviceId");
                connectToDevice(deviceId);
                result.success(null); 
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
    

    
    public void onDeviceAdded(DiscoveryManager manager, ConnectableDevice device) {
        // Handle device added
    }

    
    public void onDeviceUpdated(DiscoveryManager manager, ConnectableDevice device) {
        // Handle device updated
    }

    
    public void onDeviceRemoved(DiscoveryManager manager, ConnectableDevice device) {
        // Handle device removed
    }

    
    public void onDiscoveryFailed(DiscoveryManager manager, ServiceCommandError error) {
        // Handle discovery failure
    }

    
    public void onConnectionFailed(ConnectableDevice device, ServiceCommandError error) {
        // Handle connection failure
    }

    
    public void onDeviceReady(ConnectableDevice device) {
        // Handle device ready
    }

    
    public void onDeviceDisconnected(ConnectableDevice device) {
        // Handle device disconnected
    }

    
    public void onCapabilityUpdated(ConnectableDevice device, List<String> added, List<String> removed) {
        // Handle capability updated
    }


    

    
     @Override
        public void onPairingRequired(ConnectableDevice device, DeviceService service, PairingType pairingType) {

            switch (pairingType) { 


                case FIRST_SCREEN:
                    Log.d("Conected", "alert pairing");
                    pairAlertDialog();
                    break;

                case PIN_CODE:
                case MIXED:
                    Log.d("Connected", "pin code pairing");
                    pairCodeDialog();
                    break;

                case NONE:
                default:
                    break;
            }
        }


   public boolean connectToDevice(String deviceId) {
    ConnectableDevice device = DiscoveryManager.getInstance().getCompatibleDevices().get(deviceId);
    if (device != null) {
        device.addListener(this);
        device.connect();
        return true;
    } else {
        return false;
    }
}


    public List<Map<String, Object>> getAvailableDevices() {
        List<Map<String, Object>> devicesList = new ArrayList<>();

        for (ConnectableDevice device : DiscoveryManager.getInstance().getCompatibleDevices().values()) {
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

    // // Method to get a list of available devices
    // public List<ConnectableDevice> getAvailableDevices() {
    //     Map<String, ConnectableDevice> compatibleDevices = DiscoveryManager.getInstance().getCompatibleDevices();
    //     return new ArrayList<>(compatibleDevices.values());
    // }
}
