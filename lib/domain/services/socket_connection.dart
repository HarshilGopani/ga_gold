import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/data/helpers/api_wrapper.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketConnection {
  static IO.Socket? socket;

  static socketDisconnect() {
    socket?.disconnect();
  }

  static initSocket() {
    socket = IO.io(ApiWrapper.baseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket!.connect();
    socket!.onConnect((_) {
      print("Conttecty SuseesFully...");
      socket!.emit('init', {
        'channelID': Get.find<Repository>().getStringValue(LocalKeys.chanelId),
      });
    });

    socket!.on(Get.find<Repository>().getStringValue(LocalKeys.chanelId),
        (data) async {
      // if (data['event'] == 'changeProductVisibleStatus') {
      //   Get.find<Repository>().saveValue(
      //       LocalKeys.productVisible, data['data']['product_visible']);
      //   Get.forceAppUpdate();
      // } else
      if (data['event'] == 'orderApproved') {
        Get.find<OrderController>().postOrderHistory();
        Get.forceAppUpdate();
      } else if (data['event'] == 'orderCancelled') {
        Get.find<OrderController>().postOrderHistory();
        Get.forceAppUpdate();
      } else if (data['event'] == 'orderCompleted') {
        Get.find<OrderController>().postOrderHistory();
        Get.forceAppUpdate();
      } else if (data['event'] == 'repairingOrderApproved') {
        Get.put<RepairController>(
          RepairController(
            Get.put(
              RepairPresenter(
                Get.put(
                  RepairUsecases(
                    Get.find(),
                  ),
                  permanent: true,
                ),
              ),
              permanent: true,
            ),
          ),
        ).repairOrderPagingController.refresh();
        Get.forceAppUpdate();
      } else if (data['event'] == 'repairingOrderCancelled') {
        Get.find<RepairController>().repairOrderPagingController.refresh();
        Get.forceAppUpdate();
      } else if (data['event'] == 'repairingOrderCompleted') {
        Get.find<RepairController>().repairOrderPagingController.refresh();
        Get.forceAppUpdate();
      } else if (data['event'] == 'sampleOrderApproved') {
        Get.find<RepairController>().smaplePagingController.refresh();
        Get.forceAppUpdate();
      } else if (data['event'] == 'sampleOrderCancelled') {
        Get.find<RepairController>().smaplePagingController.refresh();
        Get.forceAppUpdate();
      } else if (data['event'] == 'sampleOrderCompleted') {
        Get.find<RepairController>().smaplePagingController.refresh();
        Get.forceAppUpdate();
      }
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }
}
