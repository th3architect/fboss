namespace cpp2 facebook.fboss
namespace py neteng.fboss.qsfp

include "common/fb303/if/fb303.thrift"
include "fboss/agent/if/fboss.thrift"
include "fboss/agent/if/optic.thrift"
include "fboss/agent/switch_config.thrift"

service QsfpService extends fb303.FacebookService {
  optic.TransceiverType type(1: i16 idx)

  /*
   * Get all information about a transceiver
   */
  optic.TransceiverInfo getTransceiverInfo(1: i16 idx)
    throws (1: fboss.FbossBaseError error)
  /*
   * Whether there is a a transceiver plugged into a port
   */
  bool isTransceiverPresent(1: i16 idx)
    throws (1: fboss.FbossBaseError error)
  /*
   * Force an update of the transceiver information in the cache
   */
  void updateTransceiverInfoFields(1: i16 idx)
    throws (1: fboss.FbossBaseError error)
  /*
   * Customise the transceiver based on the speed at which it should run
   */
  void customizeTransceiver(1: i16 idx,
      2: switch_config.PortSpeed speed)
    throws (1: fboss.FbossBaseError error)
}
