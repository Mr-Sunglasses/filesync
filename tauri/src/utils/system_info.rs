use std::{fmt, net::Ipv4Addr};

use mockall::predicate::*;
use serde::{Deserialize, Serialize};

use ts_rs::TS;

#[derive(Debug, Deserialize, Serialize, Clone, TS)]
#[ts(export)]
#[serde(rename_all = "camelCase")]
struct MyDisk {
    type_: String,
    device_name: String,
    file_system: Vec<u8>,
    mount_point: String,
    total_space: u64,
    available_space: u64,
    is_removable: bool,
}
#[derive(Debug, Deserialize, Serialize, Clone, TS)]
#[ts(export)]
#[serde(rename_all = "camelCase")]
pub struct Drives {
    array_of_drives: Vec<MyDisk>,
}

#[derive(Debug, Serialize, Deserialize, Clone, TS)]
#[serde(rename_all = "camelCase")]
#[ts(export)]
pub struct SystemInformation {
    /// the current user name eg - drizzle
    pub system_name: String,
    /// the disks
    pub disk: Drives,
    /// available store
    pub available_disk: String,
    /// used space
    pub used_disk: String,
    /// the port on which the core server runs
    port: u128,
    /// the system ip address
    pub ip_address: Ipv4Addr,
    /// the server base URL constructed form the ip address and port
    pub server_base_url: String,
}

impl std::default::Default for SystemInformation {
    fn default() -> Self {
        Self {
            system_name: String::from(""),
            disk: Drives {
                array_of_drives: Vec::new(),
            },
            available_disk: String::from(""),
            used_disk: String::from(""),
            port: 0,
            ip_address: Ipv4Addr::from([0, 0, 0, 0]),
            server_base_url: String::from(""),
        }
    }
}

/// system information construct
/// accepts the system name name and returns an instance of the struct with the remaining values constructed internally
//TODO: INJECT SERVER URL AND PORT

impl SystemInformation {
    pub fn new() -> Self {
        Self {
            ..Default::default()
        }
    }
}

//impl display for system information type
impl fmt::Display for SystemInformation {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "system_name: {},
            disk: {:?},
            available space: {},
            used space: {},
            port: {},
            ip_address {:?}
            server_base_url {:?}
            ",
            self.system_name,
            self.disk,
            self.available_disk,
            self.used_disk,
            self.port,
            self.ip_address,
            self.server_base_url
        )
    }
}
