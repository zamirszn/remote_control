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


public class MyRemoteControlPlugin implements ConnectableDeviceListener {

    private ConnectableDevice mTV;

    // Method invoked from Flutter to initialize Connect SDK and start device discovery
    public void initialize(Context context) {
        DiscoveryManager.init(context);
        DiscoveryManager.getInstance().registerDefaultDeviceTypes();
        DiscoveryManager.getInstance().setPairingLevel(PairingLevel.ON);
        DiscoveryManager.getInstance().start();
    }

    
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

    
    public void onPairingRequired(ConnectableDevice device, DeviceService service, PairingType pairingType) {
        // Handle pairing required
    }


    public void connectToDevice(String deviceId) {
        ConnectableDevice device = DiscoveryManager.getInstance().getCompatibleDevices().get(deviceId);
        if (device != null) {
            device.addListener(this);
            device.connect();
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
