/* spice-client-glib-2.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Spice", gir_namespace = "SpiceClientGLib", gir_version = "2.0", lower_case_cprefix = "spice_")]
namespace Spice {
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_audio_get_type ()")]
	public abstract class Audio : GLib.Object {
		[CCode (has_construct_function = false)]
		[Deprecated (since = "0.8")]
		public Audio (Spice.Session session, GLib.MainContext context, string name);
		[NoWrapper]
		public virtual bool connect_channel (Spice.Channel channel);
		public static unowned Spice.Audio @get (Spice.Session session, GLib.MainContext? context);
		[NoAccessorMethod]
		public GLib.MainContext main_context { owned get; construct; }
		[NoAccessorMethod]
		public Spice.Session session { owned get; construct; }
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_channel_get_type ()")]
	public class Channel : GLib.Object {
		[CCode (has_construct_function = false)]
		public Channel (Spice.Session s, int type, int id);
		[NoWrapper]
		public virtual void channel_disconnect ();
		[NoWrapper]
		public virtual void channel_reset (bool migrating);
		[NoWrapper]
		public virtual void channel_up ();
		public bool connect ();
		public void destroy ();
		public void disconnect (Spice.ChannelEvent reason);
		[NoWrapper]
		public virtual void handle_msg (Spice.MsgIn msg);
		[NoWrapper]
		public virtual void iterate_read ();
		[NoWrapper]
		public virtual void iterate_write ();
		public void set_capability (uint32 cap);
		public bool test_capability (uint32 cap);
		public bool test_common_capability (uint32 cap);
		public static unowned string type_to_string (int type);
		[NoAccessorMethod]
		public int channel_id { get; construct; }
		[NoAccessorMethod]
		public int channel_type { get; construct; }
		[NoAccessorMethod]
		public Spice.Session spice_session { owned get; construct; }
		[NoAccessorMethod]
		public ulong total_read_bytes { get; }
		public virtual signal void channel_event (Spice.ChannelEvent event);
		[HasEmitter]
		public virtual signal void open_fd (int with_tls);
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_cursor_channel_get_type ()")]
	public class CursorChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected CursorChannel ();
		public virtual signal void cursor_hide ();
		public virtual signal void cursor_move (int x, int y);
		public virtual signal void cursor_reset ();
		public virtual signal void cursor_set (int width, int height, int hot_x, int hot_y, void* rgba);
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_display_channel_get_type ()")]
	public class DisplayChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected DisplayChannel ();
		[NoAccessorMethod]
		public uint height { get; }
		[NoAccessorMethod]
		public uint width { get; }
		public virtual signal void display_invalidate (int x, int y, int w, int h);
		public virtual signal void display_mark (int mark);
		public virtual signal void display_primary_create (int format, int width, int height, int stride, int shmid, void* data);
		public virtual signal void display_primary_destroy ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_inputs_channel_get_type ()")]
	public class InputsChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected InputsChannel ();
		[NoAccessorMethod]
		public int key_modifiers { get; }
		public virtual signal void inputs_modifiers ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_main_channel_get_type ()")]
	public class MainChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected MainChannel ();
		[NoAccessorMethod]
		public int agent_caps_0 { get; }
		[NoAccessorMethod]
		public bool agent_connected { get; }
		[NoAccessorMethod]
		public uint color_depth { get; set construct; }
		[NoAccessorMethod]
		public bool disable_animation { get; set construct; }
		[NoAccessorMethod]
		public bool disable_display_position { get; set construct; }
		[NoAccessorMethod]
		public bool disable_font_smooth { get; set construct; }
		[NoAccessorMethod]
		public bool disable_wallpaper { get; set construct; }
		[NoAccessorMethod]
		public int mouse_mode { get; }
		public signal void main_agent_update ();
		[Deprecated (since = "0.6")]
		public signal void main_clipboard (uint type, void* data, uint size);
		[Deprecated (since = "0.6")]
		public signal bool main_clipboard_grab (void* types, uint ntypes);
		[Deprecated (since = "0.6")]
		public signal void main_clipboard_release ();
		[Deprecated (since = "0.6")]
		public signal bool main_clipboard_request (uint types);
		public signal void main_clipboard_selection (uint object, uint p0, void* p1, uint p2);
		public signal bool main_clipboard_selection_grab (uint types, void* ntypes, uint since);
		public signal void main_clipboard_selection_release (uint since);
		public signal bool main_clipboard_selection_request (uint types, uint returns);
		public signal void main_mouse_update ();
		public signal void migration_started (GLib.Object session);
	}
	[CCode (cheader_filename = "spice-client.h")]
	[Compact]
	public class MsgIn {
	}
	[CCode (cheader_filename = "spice-client.h")]
	[Compact]
	public class MsgOut {
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_playback_channel_get_type ()")]
	public class PlaybackChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected PlaybackChannel ();
		public void set_delay (uint32 delay_ms);
		[NoAccessorMethod]
		public bool mute { get; set; }
		[NoAccessorMethod]
		public uint nchannels { get; set; }
		[NoAccessorMethod]
		public void* volume { get; set; }
		public virtual signal void playback_data (void* data, int size);
		public signal void playback_get_delay ();
		public virtual signal void playback_start (int format, int channels, int freq);
		public virtual signal void playback_stop ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_record_channel_get_type ()")]
	public class RecordChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected RecordChannel ();
		[NoWrapper]
		public virtual void record_data (void* data, int size);
		[NoAccessorMethod]
		public bool mute { get; set; }
		[NoAccessorMethod]
		public uint nchannels { get; set; }
		[NoAccessorMethod]
		public void* volume { get; set; }
		public virtual signal void record_start (int format, int channels, int freq);
		public virtual signal void record_stop ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_session_get_type ()")]
	public class Session : GLib.Object {
		[CCode (has_construct_function = false)]
		public Session ();
		public bool connect ();
		public void disconnect ();
		public GLib.List<weak Spice.Channel> get_channels ();
		public bool get_read_only ();
		public bool has_channel_type (int type);
		public bool open_fd (int fd);
		[NoAccessorMethod]
		public string ca_file { owned get; set; }
		[NoAccessorMethod]
		public string cert_subject { owned get; set; }
		[NoAccessorMethod]
		public string ciphers { owned get; set; }
		[NoAccessorMethod]
		public bool client_sockets { get; set; }
		[NoAccessorMethod]
		public int color_depth { get; set; }
		[CCode (array_length = false, array_null_terminated = true)]
		[NoAccessorMethod]
		public string[] disable_effects { owned get; set; }
		[NoAccessorMethod]
		public bool enable_audio { get; set construct; }
		[NoAccessorMethod]
		public bool enable_smartcard { get; set; }
		[NoAccessorMethod]
		public bool enable_usbredir { get; set construct; }
		[NoAccessorMethod]
		public string host { owned get; set construct; }
		[NoAccessorMethod]
		public bool inhibit_keyboard_grab { get; set; }
		[NoAccessorMethod]
		public Spice.SessionMigration migration_state { get; }
		[NoAccessorMethod]
		public string password { owned get; set; }
		[NoAccessorMethod]
		public string port { owned get; set; }
		[NoAccessorMethod]
		public int protocol { get; set construct; }
		[NoAccessorMethod]
		public GLib.ByteArray pubkey { owned get; set; }
		[NoAccessorMethod]
		public bool read_only { get; set construct; }
		[CCode (array_length = false, array_null_terminated = true)]
		[NoAccessorMethod]
		public string[] smartcard_certificates { owned get; set; }
		[NoAccessorMethod]
		public string smartcard_db { owned get; set; }
		[NoAccessorMethod]
		public string tls_port { owned get; set; }
		[NoAccessorMethod]
		public string uri { owned get; set; }
		[NoAccessorMethod]
		public Spice.SessionVerify verify { get; set construct; }
		public virtual signal void channel_destroy (Spice.Channel channel);
		public virtual signal void channel_new (Spice.Channel channel);
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_smartcard_channel_get_type ()")]
	public class SmartcardChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected SmartcardChannel ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_smartcard_manager_get_type ()")]
	public class SmartcardManager : GLib.Object {
		[CCode (has_construct_function = false)]
		protected SmartcardManager ();
		public static unowned Spice.SmartcardManager @get ();
		public bool insert_card ();
		public bool remove_card ();
		public virtual signal void card_inserted (Spice.VReader reader);
		public virtual signal void card_removed (Spice.VReader reader);
		public virtual signal void reader_added (Spice.VReader reader);
		public virtual signal void reader_removed (Spice.VReader reader);
	}
	[CCode (cheader_filename = "spice-client.h")]
	[Compact]
	public class SmartcardReader {
		public bool is_software ();
	}
	[CCode (cheader_filename = "spice-client.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "spice_usb_device_get_type ()")]
	[Compact]
	public class UsbDevice {
		public string get_description ();
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_usb_device_manager_get_type ()")]
	public class UsbDeviceManager : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected UsbDeviceManager ();
		public async bool connect_device_async (Spice.UsbDevice device, GLib.Cancellable? cancellable) throws GLib.Error;
		public void disconnect_device (Spice.UsbDevice device);
		public static unowned Spice.UsbDeviceManager @get (Spice.Session session, GLib.MainContext main_context) throws GLib.Error;
		public GLib.GenericArray<Spice.UsbDevice> get_devices ();
		public bool is_device_connected (Spice.UsbDevice device);
		[NoAccessorMethod]
		public bool auto_connect { get; set; }
		[NoAccessorMethod]
		public GLib.MainContext main_context { owned get; construct; }
		[NoAccessorMethod]
		public Spice.Session session { owned get; construct; }
		public virtual signal void auto_connect_failed (Spice.UsbDevice device, GLib.Error error);
		public virtual signal void device_added (Spice.UsbDevice device);
		public virtual signal void device_removed (Spice.UsbDevice device);
	}
	[CCode (cheader_filename = "spice-client.h", type_id = "spice_usbredir_channel_get_type ()")]
	public class UsbredirChannel : Spice.Channel {
		[CCode (has_construct_function = false)]
		protected UsbredirChannel ();
	}
	[CCode (cheader_filename = "spice-client.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", lower_case_csuffix = "smartcard_reader", type_id = "spice_smartcard_reader_get_type ()")]
	[Compact]
	public class VReader {
	}
	[CCode (cheader_filename = "spice-client.h", cprefix = "SPICE_CHANNEL_")]
	public enum ChannelEvent {
		NONE,
		OPENED,
		SWITCHING,
		CLOSED,
		ERROR_CONNECT,
		ERROR_TLS,
		ERROR_LINK,
		ERROR_AUTH,
		ERROR_IO
	}
	[CCode (cheader_filename = "spice-client.h", cprefix = "SPICE_INPUTS_")]
	[Flags]
	public enum InputsLock {
		SCROLL_LOCK,
		NUM_LOCK,
		CAPS_LOCK
	}
	[CCode (cheader_filename = "spice-client.h", cprefix = "SPICE_SESSION_MIGRATION_")]
	public enum SessionMigration {
		NONE,
		SWITCHING,
		MIGRATING
	}
	[CCode (cheader_filename = "spice-client.h", cprefix = "SPICE_SESSION_VERIFY_")]
	[Flags]
	public enum SessionVerify {
		PUBKEY,
		HOSTNAME,
		SUBJECT
	}
	[CCode (cheader_filename = "spice-client.h", cprefix = "SPICE_CLIENT_ERROR_")]
	public errordomain ClientError {
		[CCode (cname = "SPICE_CLIENT_ERROR_FAILED")]
		CLIENT_ERROR_FAILED;
		public static GLib.Quark quark ();
	}
	[CCode (cheader_filename = "spice-client.h", cname = "spice_msg_handler", has_target = false)]
	public delegate void msg_handler (Spice.Channel channel, Spice.MsgIn @in);
	[CCode (cheader_filename = "spice-client.h", cname = "SPICE_RESERVED_PADDING")]
	public const int RESERVED_PADDING;
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_button_press (Spice.InputsChannel channel, int button, int button_state);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_button_release (Spice.InputsChannel channel, int button, int button_state);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_key_press (Spice.InputsChannel channel, uint scancode);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_key_release (Spice.InputsChannel channel, uint scancode);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_motion (Spice.InputsChannel channel, int dx, int dy, int button_state);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_position (Spice.InputsChannel channel, int x, int y, int display, int button_state);
	[CCode (cheader_filename = "spice-client.h")]
	public static void inputs_set_key_locks (Spice.InputsChannel channel, uint locks);
	[CCode (cheader_filename = "spice-client.h")]
	[Deprecated (since = "0.6")]
	public static void main_clipboard_grab (Spice.MainChannel channel, uint32 types, int ntypes);
	[CCode (cheader_filename = "spice-client.h")]
	[Deprecated (since = "0.6")]
	public static void main_clipboard_notify (Spice.MainChannel channel, uint32 type, uint8 data, ulong size);
	[CCode (cheader_filename = "spice-client.h")]
	[Deprecated (since = "0.6")]
	public static void main_clipboard_release (Spice.MainChannel channel);
	[CCode (cheader_filename = "spice-client.h")]
	[Deprecated (since = "0.6")]
	public static void main_clipboard_request (Spice.MainChannel channel, uint32 type);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_clipboard_selection_grab (Spice.MainChannel channel, uint selection, uint32 types, int ntypes);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_clipboard_selection_notify (Spice.MainChannel channel, uint selection, uint32 type, uint8 data, ulong size);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_clipboard_selection_release (Spice.MainChannel channel, uint selection);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_clipboard_selection_request (Spice.MainChannel channel, uint selection, uint32 type);
	[CCode (cheader_filename = "spice-client.h")]
	public static bool main_send_monitor_config (Spice.MainChannel channel);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_set_display (Spice.MainChannel channel, int id, int x, int y, int width, int height);
	[CCode (cheader_filename = "spice-client.h")]
	public static void main_set_display_enabled (Spice.MainChannel channel, int id, bool enabled);
	[CCode (cheader_filename = "spice-client.h")]
	public static void record_send_data (Spice.RecordChannel channel, void* data, size_t bytes, uint32 time);
	[CCode (cheader_filename = "spice-client.h")]
	public static void set_session_option (Spice.Session session);
	[CCode (cheader_filename = "spice-client.h")]
	public static bool util_get_debug ();
	[CCode (cheader_filename = "spice-client.h")]
	public static unowned string util_get_version_string ();
	[CCode (cheader_filename = "spice-client.h")]
	public static void util_set_debug (bool enabled);
}
