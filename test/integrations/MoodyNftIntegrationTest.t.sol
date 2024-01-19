// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodyNFT} from "../../script/DeployMoodyNft.s.sol";
import {MoodyNFT} from "../../src/MoodyNft.sol";

contract MoodyNFTIntegrationTest is Test {
    DeployMoodyNFT deployer;
    MoodyNFT moodNft;
    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployMoodyNFT();
        moodNft = deployer.run();
    }

    function testViewTokenUriIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToSad() public {
        string
            memory expectedMetadata = "data:application/json;base64,eyJuYW1lIjoiTW9vZHkgTkZUIiwgImRlc2NyaXB0aW9uIjoiQW4gTkZUIHRoYXQgcmVmbGVjdHMgdGhlIG1vb2Qgb2YgdGhlIG93bmVyLCAxMDAlIG9uIENoYWluISIsICJhdHRyaWJ1dGVzIjogW3sidHJhaXRfdHlwZSI6ICJtb29kaW5lc3MiLCAidmFsdWUiOiAxMDB9XSwgImltYWdlIjoiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCNGJXeHVjejBpYUhSMGNEb3ZMM2QzZHk1M015NXZjbWN2TWpBd01DOXpkbWNpSUhacFpYZENiM2c5SWpBZ01DQTBPQ0EwT0NJK1BHUmxabk0rUEhOMGVXeGxQaTVqYkhNdE1YdG1hV3hzT2lObVptTmxOVEk3ZlM1amJITXRNbnRtYVd4c09pTXpZbU0xWmpZN2ZTNWpiSE10TTN0bWFXeHNPaU15TnpNNU5ERTdmUzVqYkhNdE5IdG1hV3hzT2lNeE5ERmxNakU3ZlM1amJITXROWHRtYVd4c09pTm1ObVpoWm1RN2ZTNWpiSE10Tm50bWFXeHNPaU5tWm1Vek5qazdmUzVqYkhNdE4zdG1hV3hzT2lObVptSXpNbUk3ZlM1amJITXRPSHRtYVd4c09pTXdNR0V6WlRFN2ZUd3ZjM1I1YkdVK1BDOWtaV1p6UGp4MGFYUnNaVDR5TXkxellXUThMM1JwZEd4bFBqeG5JR2xrUFNKZk1qTXRjMkZrSWlCa1lYUmhMVzVoYldVOUlqSXpMWE5oWkNJK1BHTnBjbU5zWlNCamJHRnpjejBpWTJ4ekxURWlJR040UFNJeU5DSWdZM2s5SWpJMElpQnlQU0l5TXlJdlBqeHdZWFJvSUdOc1lYTnpQU0pqYkhNdE1pSWdaRDBpVFRNM0xETTFMalkyTjBFekxqRTNPU3d6TGpFM09Td3dMREFzTVN3ek5Dd3pPV0V6TGpFM09Td3pMakUzT1N3d0xEQXNNUzB6TFRNdU16TXpRek14TERNekxqZ3lOaXd6TXk0eU5Td3lPU3d6TkN3eU9WTXpOeXd6TXk0NE1qWXNNemNzTXpVdU5qWTNXaUl2UGp4d1lYUm9JR05zWVhOelBTSmpiSE10TXlJZ1pEMGlUVEV3TERFM1ZqRTFZek11TnpJeUxEQXNOaTB4TGpJNU5TdzJMVEpvTWtNeE9Dd3hOUzQyTWpZc01UTXVPVGMyTERFM0xERXdMREUzV2lJdlBqeHdZWFJvSUdOc1lYTnpQU0pqYkhNdE15SWdaRDBpVFRNNExERTNZeTB6TGprM05pd3dMVGd0TVM0ek56UXRPQzAwYURKak1Dd3VOekExTERJdU1qYzRMRElzTml3eVdpSXZQanh3WVhSb0lHTnNZWE56UFNKamJITXRNeUlnWkQwaVRUSTBMRE0xWVRFd0xqTTBNeXd4TUM0ek5ETXNNQ3d3TERBdE5Dd3hMRFFzTkN3d0xEQXNNU3c0TERCQk1UQXVNelF6TERFd0xqTTBNeXd3TERBc01Dd3lOQ3d6TlZvaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXRNeUlnWTNnOUlqTTBJaUJqZVQwaU1qSWlJSEk5SWpVaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXRNeUlnWTNnOUlqRTBJaUJqZVQwaU1qSWlJSEk5SWpVaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXROQ0lnWTNnOUlqTTBJaUJqZVQwaU1qSWlJSEk5SWpRaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXROQ0lnWTNnOUlqRTBJaUJqZVQwaU1qSWlJSEk5SWpRaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXROU0lnWTNnOUlqTTFMalVpSUdONVBTSXlNQzQxSWlCeVBTSXhMalVpTHo0OFkybHlZMnhsSUdOc1lYTnpQU0pqYkhNdE5TSWdZM2c5SWpNeUxqVWlJR041UFNJeU15NDFJaUJ5UFNJeExqVWlMejQ4WTJseVkyeGxJR05zWVhOelBTSmpiSE10TlNJZ1kzZzlJak0xTGpVaUlHTjVQU0l5TXk0MUlpQnlQU0l3TGpVaUx6NDhZMmx5WTJ4bElHTnNZWE56UFNKamJITXROU0lnWTNnOUlqRXlMalVpSUdONVBTSXlNQzQxSWlCeVBTSXhMalVpTHo0OFkybHlZMnhsSUdOc1lYTnpQU0pqYkhNdE5TSWdZM2c5SWpFMUxqVWlJR041UFNJeU15NDFJaUJ5UFNJeExqVWlMejQ4WTJseVkyeGxJR05zWVhOelBTSmpiSE10TlNJZ1kzZzlJakV5TGpVaUlHTjVQU0l5TXk0MUlpQnlQU0l3TGpVaUx6NDhjR0YwYUNCamJHRnpjejBpWTJ4ekxUWWlJR1E5SWsweU5DdzBZekV5TGpFMUxEQXNNaklzT0M0MU1EY3NNaklzTVRsb0xqazNOV0V5TXl3eU15d3dMREFzTUMwME5TNDVOU3d3U0RKRE1pd3hNaTQxTURjc01URXVPRFVzTkN3eU5DdzBXaUl2UGp4d1lYUm9JR05zWVhOelBTSmpiSE10TnlJZ1pEMGlUVFEyTERJell6QXNNVEF1TkRrekxUa3VPRFVzTVRrdE1qSXNNVGxUTWl3ek15NDBPVE1zTWl3eU0wZ3hMakF5TldNdExqQXhOQzR6TXpJdExqQXlOUzQyTmpVdExqQXlOU3d4WVRJekxESXpMREFzTUN3d0xEUTJMREJqTUMwdU16TTFMUzR3TVRFdExqWTJPQzB1TURJMUxURmFJaTgrUEdWc2JHbHdjMlVnWTJ4aGMzTTlJbU5zY3kwMUlpQmplRDBpTXpjaUlHTjVQU0k1SWlCeWVEMGlNQzQ0TWpVaUlISjVQU0l4TGpFME9DSWdkSEpoYm5ObWIzSnRQU0owY21GdWMyeGhkR1VvTkM0ME9DQXlPQzQ0TVNrZ2NtOTBZWFJsS0MwME5TNHdNaWtpTHo0OFpXeHNhWEJ6WlNCamJHRnpjejBpWTJ4ekxUVWlJR040UFNJek1DNDNORFlpSUdONVBTSTBMalVpSUhKNFBTSXdMalF4TXlJZ2NuazlJakF1TlRjMElpQjBjbUZ1YzJadmNtMDlJblJ5WVc1emJHRjBaU2cxTGpneU9TQXlNeTR3TmpjcElISnZkR0YwWlNndE5EVXVNRElwSWk4K1BHVnNiR2x3YzJVZ1kyeGhjM005SW1Oc2N5MDFJaUJqZUQwaU16UWlJR041UFNJM0lpQnllRDBpTVM0Mk5TSWdjbms5SWpJdU1qazNJaUIwY21GdWMyWnZjbTA5SW5SeVlXNXpiR0YwWlNnMUxqQXhOU0F5Tmk0eE1ESXBJSEp2ZEdGMFpTZ3RORFV1TURJcElpOCtQSEJoZEdnZ1kyeGhjM005SW1Oc2N5MDRJaUJrUFNKTk16UXVNVE0xTERJNUxqQTBOMk11TnpJekxqUXpPU3d5TGpNMk5Td3pMamt3T0N3eUxqTTJOU3cxTGpJNE5tRXlMalV3TlN3eUxqVXdOU3d3TERFc01TMDFMREJqTUMweExqTTNPQ3d4TGpZME1pMDBMamcwTnl3eUxqTTJOUzAxTGpJNE5pMHVPRFV5TGpRMk9TMHlMamcyTlN3MExqZzNOeTB5TGpnMk5TdzJMall5UVRNdU1UYzVMRE11TVRjNUxEQXNNQ3d3TERNMExETTVZVE11TVRjNUxETXVNVGM1TERBc01Dd3dMRE10TXk0ek16TkRNemNzTXpNdU9USTBMRE0wTGprNE55d3lPUzQxTVRZc016UXVNVE0xTERJNUxqQTBOMW9pTHo0OFpXeHNhWEJ6WlNCamJHRnpjejBpWTJ4ekxUVWlJR040UFNJek5TSWdZM2s5SWpNMUlpQnllRDBpTUM0NE1qVWlJSEo1UFNJeExqRTBPQ0lnZEhKaGJuTm1iM0p0UFNKMGNtRnVjMnhoZEdVb0xURTBMalE1TnlBek5TNHdNVGNwSUhKdmRHRjBaU2d0TkRVdU1ESXBJaTgrUEdWc2JHbHdjMlVnWTJ4aGMzTTlJbU5zY3kwMUlpQmplRDBpTXpVdU56UTJJaUJqZVQwaU16TXVOU0lnY25nOUlqQXVOREV6SWlCeWVUMGlNQzQxTnpRaUlIUnlZVzV6Wm05eWJUMGlkSEpoYm5Oc1lYUmxLQzB4TXk0eU1UZ2dNelV1TVRBMUtTQnliM1JoZEdVb0xUUTFMakF5S1NJdlBqeHdZWFJvSUdOc1lYTnpQU0pqYkhNdE55SWdaRDBpVFRNMExETTVZVE11TURRNExETXVNRFE0TERBc01Dd3hMVEl1T0RVekxUSXVNelUwUVRRdU9EQTRMRFF1T0RBNExEQXNNQ3d3TERNeExETTNMalkyTnl3ekxqRTNPU3d6TGpFM09Td3dMREFzTUN3ek5DdzBNV0V6TGpFM09Td3pMakUzT1N3d0xEQXNNQ3d6TFRNdU16TXpMRFF1T0RBNExEUXVPREE0TERBc01Dd3dMUzR4TkRjdE1TNHdNakZCTXk0d05EZ3NNeTR3TkRnc01Dd3dMREVzTXpRc016bGFJaTgrUEM5blBqd3ZjM1puUGc9PSJ9";
        vm.prank(USER);
        moodNft.mintNft();
        vm.prank(USER);
        moodNft.flipMood(0);
        assert(
            keccak256(abi.encodePacked(moodNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(expectedMetadata))
        );
    }
}