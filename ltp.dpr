program ltp;

uses
  Vcl.Forms,
  Windows,
  Messages,
  Dialogs,
  System.SysUtils,
  uBaseResource in 'resources\uBaseResource.pas' {BaseResource: TDataModule},
  uExchDBData in 'resources\uExchDBData.pas',
  uExchDBDataThread in 'resources\uExchDBDataThread.pas',
  uResource in 'resources\uResource.pas' {Resource: TDataModule},
  uResourceForms in 'resources\uResourceForms.pas',
  uExchDB in 'resources\uExchDB.pas',
  uControlsLocalization in 'baseform\uControlsLocalization.pas',
  ufmBase in 'baseform\ufmBase.pas' {fmBase},
  ufmBaseFind in 'baseform\ufmBaseFind.pas',
  ufmBaseForm in 'baseform\ufmBaseForm.pas' {fmBaseForm},
  ufmBaseGrid in 'baseform\ufmBaseGrid.pas' {fmBaseGrid},
  ufmBaseMain in 'baseform\ufmBaseMain.pas' {fmBaseMain},
  ufmBaseCard in 'baseform\ufmBaseCard.pas' {fmBaseCard},
  uBaseDlg in 'dialogs\uBaseDlg.pas' {fmBaseDlg},
  uDateSelectDlg in 'dialogs\uDateSelectDlg.pas' {fmDateSelectDlg},
  uMessage in 'dialogs\uMessage.pas' {fmMessage},
  uMessageExp in 'dialogs\uMessageExp.pas' {fmMessageExp},
  uNumSelectDlg in 'dialogs\uNumSelectDlg.pas' {fmNumSelectDlg},
  uProgressBar in 'dialogs\uProgressBar.pas' {frmProgressBar},
  uRepDlg in 'dialogs\uRepDlg.pas' {fmRepDlg},
  ExceptLibPg in 'utils\ExceptLibPg.pas',
  uArrays in 'utils\uArrays.pas',
  uArrayV in 'utils\uArrayV.pas',
  uBlobFile in 'utils\uBlobFile.pas',
  uCheckPass in 'utils\uCheckPass.pas',
  uConst in 'utils\uConst.pas',
  uConversion in 'utils\uConversion.pas',
  uCopySbl in 'utils\uCopySbl.pas' {fmCopySbl},
  uDataUtils in 'utils\uDataUtils.pas',
  uDBMemo in 'utils\uDBMemo.pas' {fmDBMemo},
  uFileUtils in 'utils\uFileUtils.pas',
  uFindSql in 'utils\uFindSql.pas',
  uFtpDownload in 'utils\uFtpDownload.pas' {fmFtpDownload},
  uGPSIntegration in 'utils\uGPSIntegration.pas',
  uHttpFtpUpDownload in 'utils\uHttpFtpUpDownload.pas',
  uKartUtils in 'utils\uKartUtils.pas',
  uLogin in 'utils\uLogin.pas' {fmLogin},
  utilSpravXML in 'utils\utilSpravXML.pas',
  uOVD in 'basicforms\uOVD.pas' {fmOVD},
  uOVDAdd in 'basicforms\uOVDAdd.pas' {fmOVDAdd},
  uFamilyCompositionAdd in 'basicforms\uFamilyCompositionAdd.pas' {fmFamilyCompositionAdd},
  uFamilyComposition in 'basicforms\uFamilyComposition.pas' {fmFamilyComposition},
  uEducation in 'basicforms\uEducation.pas' {fmEducation},
  uEducationAdd in 'basicforms\uEducationAdd.pas' {fmEducationAdd},
  uOffenses in 'basicforms\uOffenses.pas' {fmOffenses},
  uOffensesAdd in 'basicforms\uOffensesAdd.pas' {fmOffensesAdd},
  Unit1 in 'Unit1.pas' {fmBaseForm1},
  uGrdocument in 'basicforms\uGrdocument.pas' {fmGrdocument},
  uGrdocumentAdd in 'basicforms\uGrdocumentAdd.pas' {fmGrdocumentAdd},
  uCriminal in 'basicforms\uCriminal.pas' {fmCriminal},
  uCriminalAdd in 'basicforms\uCriminalAdd.pas' {fmCriminalAdd},
  uWork in 'basicforms\uWork.pas' {fmWork},
  uWorkAdd in 'basicforms\uWorkAdd.pas' {fmWorkAdd},
  uPrevention in 'basicforms\uPrevention.pas' {fmPrevention},
  uPreventionAdd in 'basicforms\uPreventionAdd.pas' {fmPreventionAdd},
  uAdres in 'basicforms\uAdres.pas' {fmAdres},
  uReferralData in 'basicforms\uReferralData.pas' {fmReferralData},
  uCommissionDecision in 'basicforms\uCommissionDecision.pas' {fmCommissionDecision},
  uCommissionDecisionAdd in 'basicforms\uCommissionDecisionAdd.pas' {fmCommissionDecisionAdd},
  uCourtdecision in 'basicforms\uCourtdecision.pas' {fmCourtdecision},
  uCourtdecisionAdd in 'basicforms\uCourtdecisionAdd.pas' {fmCourtdecisionAdd},
  uWarningcitizen in 'basicforms\uWarningcitizen.pas' {fmWarningcitizen},
  uMedinspector in 'basicforms\uMedinspector.pas' {fmMedinspector},
  uMedinspectorAdd in 'basicforms\uMedinspectorAdd.pas' {fmMedinspectorAdd},
  uMedexamination in 'basicforms\uMedexamination.pas' {fmMedexamination},
  uMedexaminationAdd in 'basicforms\uMedexaminationAdd.pas' {fmMedexaminationAdd},
  uDisease in 'basicforms\uDisease.pas' {fmDisease},
  uSocAssessment in 'basicforms\uSocAssessment.pas' {fmSocAssessment},
  uSocAssessmentAdd in 'basicforms\uSocAssessmentAdd.pas' {fmSocAssessmentAdd},
  uSocLegal in 'basicforms\uSocLegal.pas' {fmSocLegal},
  uSocLegalAdd in 'basicforms\uSocLegalAdd.pas' {fmSocLegalAdd},
  uDiseaseAdd in 'basicforms\uDiseaseAdd.pas' {fmDiseaseAdd},
  uOZ in 'basicforms\uOZ.pas' {fmOZ},
  uMedAssessment in 'basicforms\uMedAssessment.pas' {fmMedAssessment},
  uMedAssessmentAdd in 'basicforms\uMedAssessmentAdd.pas' {fmMedAssessmentAdd},
  uLtpinformationAdd in 'basicforms\uLtpinformationAdd.pas' {fmLtpinformationAdd},
  uLtpWorkAdd in 'basicforms\uLtpWorkAdd.pas' {fmLtpWorkAdd},
  uLTPPenaltyAdd in 'basicforms\uLTPPenaltyAdd.pas' {fmLtpPenaltyAdd},
  uLTPRewardAdd in 'basicforms\uLTPRewardAdd.pas' {fmLTPRewardAdd},
  uLTPExtensionAdd in 'basicforms\uLTPExtensionAdd.pas' {fmLTPExtensionAdd},
  uLtptrainingAdd in 'basicforms\uLtptrainingAdd.pas' {fmLtptrainingAdd},
  uLTPPreventiveAdd in 'basicforms\uLTPPreventiveAdd.pas' {fmLTPPreventiveAdd},
  uLTPCureAdd in 'basicforms\uLTPCureAdd.pas' {fmLTPCureAdd},
  uLTPRefusallAdd in 'basicforms\uLTPRefusallAdd.pas' {fmLTPRefusallAdd},
  uLtpinformation in 'basicforms\uLtpinformation.pas' {fmLTPInformation},
  uLtpWork in 'basicforms\uLtpWork.pas' {fmLTPWork},
  uLTPRefusall in 'basicforms\uLTPRefusall.pas' {fmLTPRefusall},
  uLTPPreventive in 'basicforms\uLTPPreventive.pas' {fmLTPPreventive},
  uLTPPenalty in 'basicforms\uLTPPenalty.pas' {fmLTPPenalty},
  uLTPReward in 'basicforms\uLTPReward.pas' {fmLTPReward},
  uLTPExtension in 'basicforms\uLTPExtension.pas' {fmLTPExtension},
  uLtptraining in 'basicforms\uLtptraining.pas' {fmLtptraining},
  uDIN in 'basicforms\uDIN.pas' {fmDIN},
  uLTP in 'basicforms\uLTP.pas' {fmLTP},
  uTCSON in 'basicforms\uTCSON.pas' {fmTCSON},
  uLTPCure in 'basicforms\uLTPCure.pas' {fmLTPCure},
  uLTPMedical in 'basicforms\uLTPMedical.pas' {fmLTPMedical},
  uLTPMedicalAdd in 'basicforms\uLTPMedicalAdd.pas' {fmLTPMedicalAdd},
  uUsers in 'basicforms\uUsers.pas' {fmUsers},
  uUsersAdd in 'basicforms\uUsersAdd.pas' {fmUsersAdd},
  uRoles in 'basicforms\uRoles.pas' {fmRoles},
  uRolesAdd in 'basicforms\uRolesAdd.pas' {fmRolesAdd},
  uPermision in 'basicforms\uPermision.pas' {fmPermision},
  uPermisionAdd in 'basicforms\uPermisionAdd.pas' {fmPermisionAdd},
  uNotifications in 'basicforms\uNotifications.pas' {fmNotifications},
  uNotificationsAdd in 'basicforms\uNotificationsAdd.pas' {fmNotificationsAdd};

{$R *.res}

var
  H: THandle;
  WinHwnd: HWND;
begin
  Application.Title := 'ЛТП';
  H := CreateMutex(nil, True, PChar(ExtractFileName(Application.ExeName)));
  //ReportMemoryLeaksOnShutdown := true;

  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    ShowMessage('Программа уже запущена!');
    WinHwnd := FindWindow(nil, PChar(ExtractFileName(Application.ExeName)));
    if WinHwnd <> 0 then
     SetForegroundWindow(WinHwnd);
    //SetForegroundWindow(FindWindow(nil, PChar(Application.Title))); // помещаем окно с уже запущенной программой на передний план
    Exit;
  end
  else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TResource, Resource);
  Application.Run;
  end;
end.
