"use client";

import Heading from "@/components/Heading";
import Text from "@/components/Text";
import View from "@/components/View";
import PageLayout from "@/components/layout/PageLayout";
import { SystemInformationContext } from "@/store/sys-info";
import { useContext } from "react";
import QRCode from "react-qr-code";

export default function ConnectionPage() {
  const { serverBaseUrl } = useContext(SystemInformationContext);

  return (
    <>
      <PageLayout pageTitle={"Connect Device"} includeSearchBar={false}>
        <View
          className=" text-center flex flex-col justify-center items-center"
          style={{ height: "600px" }}
        >
          <QRCode
            value={serverBaseUrl ? serverBaseUrl : " "}
            size={200}
            fgColor="#101010"
          />

          <View>
            <Heading className="mt-8 text-3xl text-gray-700">
              Connect Device
            </Heading>
            <Text className="mb-8 leading-5">
              Scan the QR code to connect your device
            </Text>
          </View>
        </View>
      </PageLayout>
    </>
  );
}
