unit uOVDAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, dxLayoutContainer,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.StdCtrls, cxLabel, cxCheckBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  dxLayoutControl, cxPC, dxLayoutControlAdapters, Vcl.Buttons, uExchDBData,
  Vcl.ExtCtrls, uResource, uExchDB, uFamilyComposition, uOffenses, uEducation,
  uGrdocument, uCriminal, uPrevention, uSocAssessment, uReferralData, uMedinspector,
  uWork,uMedexamination, uSocLegal, Generics.Collections, uKartUtils, uMedAssessment,
  uLTPInformation, uLTPWork, uLTPPreventive, uLTPCure,  uLTPRefusall, uLTPPenalty,
  uLTPReward, uLTPExtension, uLTPTraining;

type
  TfmOVDAdd = class(TfmBaseForm)
    cxPageControl1: TcxPageControl;
    cxGrinformation: TcxTabSheet;
    cxAdress: TcxTabSheet;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dtBirthdate: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cbbSex: TcxLookupComboBox;
    dxLayoutItem5: TdxLayoutItem;
    cbbCategory: TcxLookupComboBox;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    cbbMartial_status: TcxLookupComboBox;
    dxLayoutItem8: TdxLayoutItem;
    cbbCitizenship: TcxLookupComboBox;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    GroupBox1: TGroupBox;
    dxLayoutItem16: TdxLayoutItem;
    cxLookupComboBox5: TcxLookupComboBox;
    cxLookupComboBox7: TcxLookupComboBox;
    cxLookupComboBox8: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dxLayoutItem17: TdxLayoutItem;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxLabel2: TcxLabel;
    cxLookupComboBox9: TcxLookupComboBox;
    cxLookupComboBox10: TcxLookupComboBox;
    cxLookupComboBox11: TcxLookupComboBox;
    cxLookupComboBox12: TcxLookupComboBox;
    Action1: TAction;
    BitBtn2: TBitBtn;
    dxLayoutItem20: TdxLayoutItem;
    edFam: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    edName: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    edPatronymic: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edpersonal_num: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    Panel1: TPanel;
    actAddEdd: TAction;
    actCancel: TAction;
    btnCancel: TButton;
    dsSex: TDataSource;
    dsMarital_status: TDataSource;
    dsCitizenship: TDataSource;
    dsCategory: TDataSource;
    Button1: TButton;
    actlstN: TActionList;
    Action2: TAction;
    Action3: TAction;
    btnAddEdProject: TButton;
    cxDocument: TcxTabSheet;
    cxWork: TcxTabSheet;
    cxFamily: TcxTabSheet;
    cxCriminal: TcxTabSheet;
    cxOffenses: TcxTabSheet;
    cxEducation: TcxTabSheet;
    cxPrevention: TcxTabSheet;
    dsArea: TDataSource;
    dsRegion: TDataSource;
    cxLookupComboBox1: TcxLookupComboBox;
    dsCity: TDataSource;
    dsStreet: TDataSource;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    dsStreet_p: TDataSource;
    dsCity_p: TDataSource;
    dsArea_p: TDataSource;
    dsRegion_p: TDataSource;
    cxLookupComboBox2: TcxLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    cxLookupComboBox3: TcxLookupComboBox;
    dsCityRegion: TDataSource;
    dsCityRegion_p: TDataSource;
    cxReferralData: TcxTabSheet;
    cxMedInspector: TcxTabSheet;
    cxMedExamination: TcxTabSheet;
    cxSocLegal: TcxTabSheet;
    cxSocAssessment: TcxTabSheet;
    dsBaseAdres: TDataSource;
    dsBaseAdresPr: TDataSource;
    cxpensioner: TCheckBox;
    dxLayoutItem4: TdxLayoutItem;
    cxchild: TCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    cxyes_criminal: TCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    cxmandatory_pres: TCheckBox;
    dxLayoutItem19: TdxLayoutItem;
    cxno_work: TCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    cxantisocial_life: TCheckBox;
    dxLayoutItem13: TdxLayoutItem;
    cxMedAssessment: TcxTabSheet;
    cxLTPInformation: TcxTabSheet;
    cxLTPWork: TcxTabSheet;
    cxLTPPenalty: TcxTabSheet;
    cxLTPReward: TcxTabSheet;
    cxLTPExtension: TcxTabSheet;
    cxLTPTraining: TcxTabSheet;
    cxLTPPreventive: TcxTabSheet;
    cxLTPRefusall: TcxTabSheet;
    cxltpCure: TcxTabSheet;
    dsYch: TDataSource;
    dsORGIU: TDataSource;
    dxLayoutItem22: TdxLayoutItem;
    cxDateEdit1: TcxDateEdit;
    GroupBox3: TGroupBox;
    dxLayoutControl3: TdxLayoutControl;
    cxLookupComboBox4: TcxLookupComboBox;
    Button2: TButton;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    procedure Button1Click(Sender: TObject);
    function GenParams(): string;
    function GenParams_adreg(): string;
    function GenParams_ych(): string;
    function GenParams_adprj(): string;
    procedure FormShow(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxLookupComboBox5PropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox7PropertiesEditValueChanged(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cxLookupComboBox9PropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox10PropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox11PropertiesEditValueChanged(Sender: TObject);
    procedure btnAddEdProjectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxTextEdit4PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    Fedit: Boolean;
    dbCitizenship: TDBData;
    dbCategory: TDBData;
    dbArea: TDBData;
    dbArea_p: TDBData;
    dbYch: TDBData;
    dbRegion: TDBData;
    dbStreet: TDBData;
    dbCityRegion_p: TDBData;
    dbCityRegion: TDBData;
    dbRegion_p: TDBData;
    dbCity: TDBData;
    dbStreet_p: TDBData;
    dbCity_p: TDBData;
    dbSex: TDBData;
    dbMarital_status: TDBData;
    dbIU: TDBData;
    dbORGIU: TDBData;
    dbShowForm: TDBData;
    dbRoleName: TDBData;
    dbIU_Adres: TDBData;
    dbIU_AdresPr: TDBData;
    dbAdres: TDBData;
    procedure CreateFamily;
    procedure CreateOffenses;
    procedure CreateEducation;
    procedure CreateDocument;
    procedure CreateCriminal;
    procedure CreateLTPInformation;
    procedure CreateWork;
    procedure CreateReferralData;
    procedure CreateMedexamination;
    procedure CreateSocLegal;
    procedure CreateMedinspector;
    procedure CreatePrevention;
    procedure CreateSocAssessment;
    procedure CreateMedAssessment;
    procedure CreateLTPRefusall;
    procedure CreateLTPPenalty;
    procedure CreateLTPCure;
    procedure CreateLTPReward;
    procedure CreateLTPExtension;
    procedure CreateLtptraining;
    procedure CreateLTPPreventive;
    procedure CreateLTPWork;
    procedure FillListRequired;
    procedure FillListRequiredOsn;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
    procedure PageShow;
  public
    { Public declarations }
    dbBaseAdres: TDBData;
    dbBaseAdresPr: TDBData;
    ListRequired: TList<TComponent>;
    ListRequiredOsn: TList<TComponent>;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant);
    property ID: Variant read FID;
  end;

var
  fmOVDAdd: TfmOVDAdd;
  fFamily: TfmFamilyComposition;
  fOffenses: TfmOffenses;
  fEducation: TfmEducation;
  fDocument: TfmGrdocument;
  fCriminal: TfmCriminal;
  fWork: TfmWork;
  fPrevention: TfmPrevention;
  fReferralData: TfmReferralData;
  fMedinspector: TfmMedinspector;
  fMedexamination: TfmMedexamination;
  fSocLegal: TfmSocLegal;
  fSocAssessment: TfmSocAssessment;
  fMedAssessment: TfmMedAssessment;
  fLTPInformation: TfmLTPInformation;
  fLTPWork : TfmLTPWork;
  fLTPPreventive : TfmLTPPreventive;
  fLTPCure : TfmLTPCure;
  fLTPRefusall : TfmLTPRefusall;
  fLTPPenalty : TfmLTPPenalty;
  fLTPReward : TfmLTPReward;
  fLTPExtension : TfmLTPExtension;
  fLTPTraining : TfmLTPTraining;
 // fWork: TfmWork;
  ginformation : integer;
  gNameForm : string;
  gUserOrg : Integer;
  gShowForm : string;
  gRoleName: string;
  peditovd : Boolean;

implementation
uses
  uLogin;



{$R *.dfm}


procedure TfmOVDAdd.BitBtn2Click(Sender: TObject);
begin
  cxLookupComboBox9.EditValue := cxLookupComboBox5.EditValue;
  cxLookupComboBox10.EditValue := cxLookupComboBox1.EditValue;
  cxLookupComboBox11.EditValue := cxLookupComboBox7.EditValue;
  cxLookupComboBox12.EditValue := cxLookupComboBox8.EditValue;
  cxLookupComboBox3.EditValue := cxLookupComboBox2.EditValue;
  cxTextEdit4.Text := cxTextEdit1.Text;
  cxTextEdit5.Text := cxTextEdit2.Text;
  cxTextEdit6.Text := cxTextEdit3.Text;
end;


procedure TfmOVDAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxLookupComboBox10);
  ListRequired.Add(cxLookupComboBox11);
  ListRequired.Add(cxLookupComboBox12);
  ListRequired.Add(cxLookupComboBox9);
  ListRequired.Add(cxLookupComboBox1);
  ListRequired.Add(cxLookupComboBox5);
  ListRequired.Add(cxLookupComboBox7);
  ListRequired.Add(cxLookupComboBox8);
end;

procedure TfmOVDAdd.FillListRequiredOsn;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(edName);
  ListRequired.Add(edFam);
  ListRequired.Add(edpersonal_num);
  ListRequired.Add(edPatronymic);
  ListRequired.Add(dtBirthdate);
  ListRequired.Add(cbbSex);
  ListRequired.Add(cbbCategory);
  ListRequired.Add(cbbCitizenship);
  ListRequired.Add(cbbMartial_status);
end;

procedure TfmOVDAdd.btnAddEdProjectClick(Sender: TObject);
begin
  FillListRequiredOsn;
  if NOT Validate(ListRequired, True) then
      exit;
  if FMode = 1 then
  begin
      dbIU := DataSetQuery('grinformation_set', [FDB.DataSet.FieldByName('grinformation_id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
      ginformation := FID;

  end
  else
  begin
     dbIU := DataSetQuery('grinformation_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
     ginformation := dbIU.DataSet.FieldByName('r_id').Value;
   //  для чего???
   //  FMode := 1;

     //cxAdress.Enabled := True;

     cxAdress.Enabled := True;
     cxCriminal.Enabled := True;
     cxDocument.Enabled := True;
     cxEducation.Enabled := True;
     cxFamily.Enabled := True;
     cxMedAssessment.Enabled := True;
     cxMedExamination.Enabled := True;
     cxMedInspector.Enabled := True;
     cxOffenses.Enabled := True;
     cxPrevention.Enabled := True;
     cxReferralData.Enabled := True;
     cxSocAssessment.Enabled := True;
     cxSocLegal.Enabled := True;
     cxWork.Enabled := True;
     Button1.Enabled := True;

     cxLTPInformation.Enabled := True;
     cxLTPWork.Enabled := True;
     cxLTPPenalty.Enabled := True;
     cxLTPReward.Enabled := True;
     cxLTPExtension.Enabled := True;
     cxLTPTraining.Enabled := True;
     cxLTPPreventive.Enabled := True;
     cxLTPRefusall.Enabled := True;
     cxltpCure.Enabled := True;

     btnAddEdProject.Enabled := False;
  end;

end;

procedure TfmOVDAdd.Button1Click(Sender: TObject);
begin
 FillListRequired;

  if NOT Validate(ListRequired, True) then
      exit;

  if FMode = 1 then
  begin
      dbIU := DataSetQuery('grinformation_set', [FDB.DataSet.FieldByName('grinformation_id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
      ginformation := FID;

  end
  else
  begin
  //   dbIU := DataSetQuery('grinformation_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  //скорее всего если  ginformation = 0 тогда выполняем этот код
  //   ginformation := dbIU.DataSet.FieldByName('r_id').Value;
  end;
 // dbIU_Adres := DataSetQuery('adres_set', [VarToStr(ginformation),VarToStr(FMode), 0, Resource.sessionInfo.token_id, GenParams_adreg()]);
  dbIU_Adres := DataSetQuery('adres_set', [VarToStr(ginformation), VarToStr(FMode), '0', Resource.sessionInfo.token_id, GenParams_adreg()]);
  dbIU_Adres := DataSetQuery('adres_set', [VarToStr(ginformation), VarToStr(FMode), '1', Resource.sessionInfo.token_id, GenParams_adprj()]);
  Close;

end;

procedure TfmOVDAdd.Button2Click(Sender: TObject);
begin
  dbIU := DataSetQuery('precincts_set', [FDB.DataSet.FieldByName('grinformation_id').Value, '0', Resource.sessionInfo.token_id, GenParams_ych()]);
end;

procedure TfmOVDAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmOVDAdd.cxLookupComboBox10PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbCity_p := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_city AS s  '+
   ' where s.region_id = '+ VarToStr(cxLookupComboBox10.EditValue), []);
  dsCity_p.DataSet := dbCity_p.DataSet;
end;

procedure TfmOVDAdd.cxLookupComboBox11PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbStreet_p := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_street AS s  '+
   ' where s.city_id = '+ VarToStr(cxLookupComboBox11.EditValue), []);
  dsStreet_p.DataSet := dbStreet_p.DataSet;

  dbCityRegion_p := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_city_region AS s  '+
   ' where s.city_id = '+ VarToStr(cxLookupComboBox11.EditValue), []);
  dsCityRegion_p.DataSet := dbCityRegion_p.DataSet;
end;

procedure TfmOVDAdd.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbCity := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_city AS s  '+
   ' where s.region_id = '+ VarToStr(cxLookupComboBox1.EditValue), []);
  dsCity.DataSet := dbCity.DataSet;
end;

procedure TfmOVDAdd.cxLookupComboBox5PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbRegion := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_region AS s  '+
   ' where s.area_id = '+ VarToStr(cxLookupComboBox5.EditValue), []);
  dsRegion.DataSet := dbRegion.DataSet;

end;

procedure TfmOVDAdd.cxLookupComboBox7PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbStreet := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_street AS s  '+
   ' where s.city_id = '+ VarToStr(cxLookupComboBox7.EditValue), []);
  dsStreet.DataSet := dbStreet.DataSet;

  dbCityRegion := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_city_region AS s  '+
   ' where s.city_id = '+ VarToStr(cxLookupComboBox7.EditValue), []);
  dsCityRegion.DataSet := dbCityRegion.DataSet;
end;

procedure TfmOVDAdd.cxLookupComboBox9PropertiesEditValueChanged(
  Sender: TObject);
begin
  dbRegion_p := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_region AS s  '+
   ' where s.area_id = '+ VarToStr(cxLookupComboBox9.EditValue), []);
  dsRegion_p.DataSet := dbRegion_p.DataSet;


end;

procedure TfmOVDAdd.cxPageControl1Change(Sender: TObject);
begin
  if ((cxPageControl1.ActivePage.Name = cxFamily.Name) and (Pos(cxFamily.Hint, gShowForm) <> 0)) then
  begin
    if (fFamily = nil) then
    begin
      CreateFamily;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxOffenses.Name) and (Pos(cxOffenses.Hint, gShowForm) <> 0)) then
  begin
    if (fOffenses = nil) then
    begin
      CreateOffenses;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxEducation.Name) and (Pos(cxEducation.Hint, gShowForm) <> 0)) then
  begin
    if (fEducation = nil) then
    begin
      CreateEducation;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxDocument.Name) and (Pos(cxDocument.Hint, gShowForm) <> 0)) then
  begin
    if (fDocument = nil) then
    begin
      CreateDocument;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxCriminal.Name) and (Pos(cxCriminal.Hint, gShowForm) <> 0)) then
  begin
    if (fCriminal = nil) then
    begin
      CreateCriminal;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxWork.Name) and (Pos(cxWork.Hint, gShowForm) <> 0)) then
  begin
    if (fWork = nil) then
    begin
      CreateWork;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxPrevention.Name) and (Pos(cxPrevention.Hint, gShowForm) <> 0)) then
  begin
    if (fPrevention = nil) then
    begin
      CreatePrevention;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxReferralData.Name) and (Pos(cxReferralData.Hint, gShowForm) <> 0)) then
  begin
    if (fReferralData = nil) then
    begin
      CreateReferralData;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxMedinspector.Name) and (Pos(cxMedinspector.Hint, gShowForm) <> 0)) then
  begin
    if (fMedinspector = nil) then
    begin
      CreateMedinspector;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxMedexamination.Name) and (Pos(cxMedexamination.Hint, gShowForm) <> 0)) then
  begin
    if (fMedexamination = nil) then
    begin
      CreateMedexamination;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxSocLegal.Name) and (Pos(cxSocLegal.Hint, gShowForm) <> 0)) then
  begin
    if (fSocLegal = nil) then
    begin
      CreateSocLegal;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxSocAssessment.Name) and (Pos(cxSocAssessment.Hint, gShowForm) <> 0)) then
  begin
    if (fSocAssessment = nil) then
    begin
      CreateSocAssessment;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxMedAssessment.Name) and (Pos(cxMedAssessment.Hint, gShowForm) <> 0)) then
  begin
    if (fMedAssessment = nil) then
    begin
      CreateMedAssessment;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxLTPInformation.Name) and (Pos(cxLTPInformation.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPInformation = nil) then
    begin
      CreateLTPInformation;
    end;
  end;

  if ((cxPageControl1.ActivePage.Name = cxLTPWork.Name) and (Pos(cxLTPWork.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPWork = nil) then
    begin
      CreateLTPWork;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxLTPPreventive.Name) and (Pos(cxLTPPreventive.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPPreventive = nil) then
    begin
      CreateLTPPreventive;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxLTPCure.Name) and (Pos(cxLTPCure.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPCure = nil) then
    begin
      CreateLTPCure;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxLTPRefusall.Name) and (Pos(cxLTPRefusall.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPRefusall = nil) then
    begin
      CreateLTPRefusall;
    end;
  end;
  if ((cxPageControl1.ActivePage.Name = cxLTPPenalty.Name) and (Pos(cxLTPPenalty.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPPenalty = nil) then
    begin
      CreateLTPPenalty;
    end;
  end;

  if ((cxPageControl1.ActivePage.Name = cxLTPReward.Name) and (Pos(cxLTPReward.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPReward = nil) then
    begin
      CreateLTPReward;
    end;
  end;

  if ((cxPageControl1.ActivePage.Name = cxLTPExtension.Name) and (Pos(cxLTPExtension.Hint, gShowForm) <> 0)) then
  begin
    if (fLTPExtension = nil) then
    begin
      CreateLTPExtension;
    end;
  end;

  if ((cxPageControl1.ActivePage.Name = cxLtptraining.Name) and (Pos(cxLtptraining.Hint, gShowForm) <> 0)) then
  begin
    if (fLtptraining = nil) then
    begin
      CreateLtptraining;
    end;
  end;
     {
  if (cxPageControl1.ActivePageIndex = cxLTPPreventive.TabIndex) then
  begin
    if (fLTPPreventive = nil) then
    begin
      CreateLTPPreventive;
    end;
  end;   }
end;
procedure TfmOVDAdd.cxTextEdit4PropertiesChange(Sender: TObject);
begin
  inherited;

end;

{
procedure TfmOVDAdd.CreateLTPPreventive;
begin
  Try
  fLTPPreventive := TfmLTPPreventive(CreateForm('TfmLTPPreventive', 'fmLTPPreventive', cxLTPPreventive, false));
  Resource.EmbedFormInPanel(fLTPPreventive, cxLTPPreventive, false);
  with fLTPPreventive do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;
    Show;
  end;
  Finally

  End;
end;
       }
procedure TfmOVDAdd.CreateLtptraining;
begin
  Try
  fLtptraining := TfmLtptraining(CreateForm('TfmLtptraining', 'fmLtptraining', cxLtptraining, false));
  Resource.EmbedFormInPanel(fLtptraining, cxLtptraining, false);
  with fLtptraining do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;
    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPExtension;
begin
  Try
  fLTPExtension := TfmLTPExtension(CreateForm('TfmLTPExtension', 'fmLTPExtension', cxLTPExtension, false));
  Resource.EmbedFormInPanel(fLTPExtension, cxLTPExtension, false);
  with fLTPExtension do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPReward;
begin
  Try
  fLTPReward := TfmLTPReward(CreateForm('TfmLTPReward', 'fmLTPReward', cxLTPReward, false));
  Resource.EmbedFormInPanel(fLTPReward, cxLTPReward, false);
  with fLTPReward do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPPenalty;
begin
  Try
    fLTPPenalty := TfmLTPPenalty(CreateForm('TfmLTPPenalty', 'fmLTPPenalty', cxLTPPenalty, false));
    Resource.EmbedFormInPanel(fLTPPenalty, cxLTPPenalty, false);
  with fLTPPenalty do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPRefusall;
begin
  Try
   fLTPRefusall := TfmLTPRefusall(CreateForm('TfmLTPRefusall', 'fmLTPRefusall', cxLTPRefusall, false));
    Resource.EmbedFormInPanel(fLTPRefusall, cxLTPRefusall, false);
  with fLTPRefusall do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPCure;
begin
  Try
  fLTPCure := TfmLTPCure(CreateForm('TfmLTPCure', 'fmLTPCure', cxLTPCure, false));
  Resource.EmbedFormInPanel(fLTPCure, cxLTPCure, false);
  with fLTPCure do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPPreventive;
begin
  Try
  fLTPPreventive := TfmLTPPreventive(CreateForm('TfmLTPPreventive', 'fmLTPPreventive', cxLTPPreventive, false));
  Resource.EmbedFormInPanel(fLTPPreventive, cxLTPPreventive, false);
  with fLTPPreventive do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPWork;
begin
  Try
  fLTPWork := TfmLTPWork(CreateForm('TfmLTPWork', 'fmLTPWork', cxLTPWork, false));
  Resource.EmbedFormInPanel(fLTPWork, cxLTPWork, false);
  with fLTPWork do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateLTPInformation;
begin
  Try
  fLTPInformation := TfmLTPInformation(CreateForm('TfmLTPInformation', 'fmLTPInformation', cxLTPInformation, false));
  Resource.EmbedFormInPanel(fLTPInformation, cxLTPInformation, false);
  with fLTPInformation do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateMedAssessment;
begin
  Try
  fMedAssessment := TfmMedAssessment(CreateForm('TfmMedAssessment', 'fmMedAssessment', cxMedAssessment, false));
  Resource.EmbedFormInPanel(fMedAssessment, cxMedAssessment, false);
  with fMedAssessment do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateSocAssessment;
begin
  Try
  fSocAssessment := TfmSocAssessment(CreateForm('TfmSocAssessment', 'fmSocAssessment', cxSocAssessment, false));
  Resource.EmbedFormInPanel(fSocAssessment, cxSocAssessment, false);
  with fSocAssessment do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;


procedure TfmOVDAdd.CreateSocLegal;
begin
  Try
  fSocLegal := TfmSocLegal(CreateForm('TfmSocLegal', 'fmSocLegal', cxSocLegal, false));
  Resource.EmbedFormInPanel(fSocLegal, cxSocLegal, false);
  with fSocLegal do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateMedexamination;
begin
  Try
  fMedexamination := TfmMedexamination(CreateForm('TfmMedexamination', 'fmMedexamination', cxMedexamination, false));
  Resource.EmbedFormInPanel(fMedexamination, cxMedexamination, false);
  with fMedexamination do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateReferralData;
begin
  Try
  fReferralData := TfmReferralData(CreateForm('TfmReferralData', 'fmReferralData', cxReferralData, false));
  Resource.EmbedFormInPanel(fReferralData, cxReferralData, false);
  with fReferralData do
  begin
   // pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateMedinspector;
begin
  Try
  fMedinspector := TfmMedinspector(CreateForm('TfmMedinspector', 'fmMedinspector', cxMedinspector, false));
  Resource.EmbedFormInPanel(fMedinspector, cxMedinspector, false);
  with fMedinspector do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreatePrevention;

begin
  Try
  fPrevention := TfmPrevention(CreateForm('TfmPrevention', 'fmPrevention', cxPrevention, false));
  Resource.EmbedFormInPanel(fPrevention, cxPrevention, false);
  with fPrevention do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateWork;
begin
  Try
  fWork := TfmWork(CreateForm('TfmWork', 'fmWork', cxWork, false));
  Resource.EmbedFormInPanel(fWork, cxWork, false);
  with fWork do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateCriminal;
begin
  Try
  fCriminal := TfmCriminal(CreateForm('TfmCriminal', 'fmCriminal', cxCriminal, false));
  Resource.EmbedFormInPanel(fCriminal, cxCriminal, false);
  with fCriminal do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateEducation;
begin
  Try
  fEducation := TfmEducation(CreateForm('TfmEducation', 'fmEducation', cxEducation, false));
  Resource.EmbedFormInPanel(fEducation, cxEducation, false);
  with fEducation do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateDocument;
begin
  Try
  fDocument := TfmGrdocument(CreateForm('TfmGrdocument', 'fmGrdocument', cxDocument, false));
  Resource.EmbedFormInPanel(fDocument, cxDocument, false);
  with fDocument do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateFamily;
begin
  Try
  fFamily := TfmFamilyComposition(CreateForm('TfmFamilyComposition', 'fmFamilyComposition', cxFamily, false));
  Resource.EmbedFormInPanel(fFamily, cxFamily, false);
  with fFamily do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.CreateOffenses;
begin
  Try
  fOffenses := TfmOffenses(CreateForm('TfmOffenses', 'fmOffenses', cxOffenses, false));
  Resource.EmbedFormInPanel(fOffenses, cxOffenses, false);
  with fOffenses do
  begin
    pnParam.Visible := false;
    cxspltrParam.Visible:= False;
    grBaseDBTableView.OptionsView.GroupByBox := true;

    Show;
  end;
  Finally
  //  FioWoodUse := '';
  End;
end;

procedure TfmOVDAdd.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fFamily);
  FreeAndNil(fOffenses);
  FreeAndNil(fEducation);
  FreeAndNil(fDocument);
  FreeAndNil(fCriminal);
  FreeAndNil(fWork);
  FreeAndNil(fPrevention);
  FreeAndNil(fReferralData);
  FreeAndNil(fMedinspector);
  FreeAndNil(fMedexamination);
  FreeAndNil(fSocLegal);
  FreeAndNil(fSocAssessment);
  FreeAndNil(fMedAssessment);
  FreeAndNil(fLTPInformation);
  FreeAndNil(fLTPWork);
  FreeAndNil(fLTPPreventive);
  FreeAndNil(fLTPCure);
  FreeAndNil(fLTPRefusall);
  FreeAndNil(fLTPPenalty);
  FreeAndNil(fLTPReward);
  FreeAndNil(fLTPExtension);
  FreeAndNil(fLTPTraining);
end;

procedure TfmOVDAdd.FormShow(Sender: TObject);
var
i : Integer;

begin

   dbShowForm := DataSetQuery('showvisible_form_get', [gUser]);
   gShowForm := dbShowForm.DataSet.FieldByName('nameform').asstring;

   dbRoleName := DataSetQuery('role_name_get', [gUser]);
   gRoleName := dbRoleName.DataSet.FieldByName('role_name').asstring;

   if gRoleName = 'chief_ovd' then
   begin
     GroupBox3.Visible := True;
   end
   else
   begin
     GroupBox3.Visible := False;
   end;



   I := Pos(cxGrinformation.Hint, gShowForm);
   if I <> 0 then
   begin

     dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_OSN'], GetFieldsArray(), true);
     peditovd := dbAccess.DataSet.FieldByName('on_edit').AsBoolean;

   end;

   dbORGIU := DataSetQuery('org_user_get', [gUser]);
   gUserOrg := dbORGIU.DataSet.FieldByName('id').AsInteger;


   InitForm;



   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin

        edFam.Text := FieldByName('family_name').AsString;
        edName.Text := FieldByName('name').AsString;
        edPatronymic.Text := FieldByName('patronymic').AsString;
        edpersonal_num.Text := FieldByName('personal_id').AsString;
        dtBirthdate.EditValue := FieldByName('birthdate').Value;
        cxDateEdit1.EditValue := FieldByName('death_date').Value;
        cxpensioner.Checked := FieldByName('pensioner').AsBoolean;
        cxchild.Checked := FieldByName('child').AsBoolean;
        cxyes_criminal.Checked := FieldByName('yes_criminal').AsBoolean;
        cxmandatory_pres.Checked := FieldByName('mandatory_pres').AsBoolean;
        cxno_work.Checked := FieldByName('no_work').AsBoolean;
        cxantisocial_life.Checked := FieldByName('antisocial_life').AsBoolean;
        cbbSex.EditValue := FieldByName('sex').Value;
        cbbCategory.EditValue := FieldByName('categ_id').Value;
        cbbCitizenship.EditValue := FieldByName('citiz_id').Value;
        cbbMartial_status.EditValue := FieldByName('stat_id').Value;
        ginformation := FID;
        btnAddEdProject.Enabled := false;
      end;
      dbBaseAdres := DataSetQuery('adresregistr_get', [VarToStr(ginformation), '0'], GetFieldsArray(), true);
      dsBaseAdres.DataSet := dbBaseAdres.DataSet;
      with dsBaseAdres.DataSet do
      begin
        cxLookupComboBox5.EditValue := FieldByName('region_id').Value;
        cxLookupComboBox1.EditValue := FieldByName('area_id').Value;
        cxLookupComboBox7.EditValue := FieldByName('city_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('city_region_id').Value;
        cxLookupComboBox8.EditValue := FieldByName('street_id').Value;
        cxTextEdit1.Text := FieldByName('building').AsString;
        cxTextEdit2.Text := FieldByName('house').AsString;
        cxTextEdit3.Text := FieldByName('flat').AsString;
      end;
      dbBaseAdresPr := DataSetQuery('adresregistr_get', [VarToStr(ginformation), '1'], GetFieldsArray(), true);
      dsBaseAdresPr.DataSet := dbBaseAdresPr.DataSet;
      with dbBaseAdresPr.DataSet do
      begin
        cxLookupComboBox9.EditValue := FieldByName('region_id').Value;
        cxLookupComboBox10.EditValue := FieldByName('area_id').Value;
        cxLookupComboBox11.EditValue := FieldByName('city_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('city_region_id').Value;
        cxLookupComboBox12.EditValue := FieldByName('street_id').Value;
        cxTextEdit4.Text := FieldByName('building').AsString;
        cxTextEdit5.Text := FieldByName('house').AsString;
        cxTextEdit6.Text := FieldByName('flat').AsString;
      end;
   end
   else
   begin
     ginformation := 0;
     cxAdress.Enabled := False;
     cxCriminal.Enabled := False;
     cxDocument.Enabled := False;
     cxEducation.Enabled := False;
     cxFamily.Enabled := False;
     cxMedAssessment.Enabled := False;
     cxMedExamination.Enabled := False;
     cxMedInspector.Enabled := False;
     cxOffenses.Enabled := False;
     cxPrevention.Enabled := False;
     cxReferralData.Enabled := False;
     cxSocAssessment.Enabled := False;
     cxSocLegal.Enabled := False;
     cxWork.Enabled := False;
     Button1.Enabled := False;

     cxLTPInformation.Enabled := False;
     cxLTPWork.Enabled := False;
     cxLTPPenalty.Enabled := False;
     cxLTPReward.Enabled := False;
     cxLTPExtension.Enabled := False;
     cxLTPTraining.Enabled := False;
     cxLTPPreventive.Enabled := False;
     cxLTPRefusall.Enabled := False;
     cxltpCure.Enabled := False;

   end;
  PageShow;
  cxPageControl1Change(cxPageControl1);
  EnabledEdData(Self, peditovd);

end;

function TfmOVDAdd.GenParams(): string;
begin
  result := '';

  IF edFam.Text <> '' then
    result := result + edFam.Text + '~'
  else
    result := result + 'NULL' + '~';

  //result := result + cxbedtNameShort.Text + '~';

  IF edName.Text <> '' then
    result := result + edName.Text + '~'
  else
    result := result + 'NULL' + '~';

  IF edPatronymic.Text <> '' then
    result := result + edPatronymic.Text + '~'
  else
    result := result + 'NULL' + '~';

  IF edpersonal_num.Text <> '' then
    result := result + edpersonal_num.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(dtBirthdate) + '~';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cbbSex) + '~';
  result := result + GetLcbValue(cbbCategory) + '~';
  result := result + GetLcbValue(cbbCitizenship) + '~';
  result := result + GetLcbValue(cbbMartial_status) + '~';
  Result := Result + BoolToStr(cxpensioner.Checked, True) + '~';
  Result := Result + BoolToStr(cxchild.Checked, True) + '~';
  Result := Result + BoolToStr(cxyes_criminal.Checked, True) + '~';
  Result := Result + BoolToStr(cxmandatory_pres.Checked, True) + '~';
  Result := Result + BoolToStr(cxno_work.Checked, True) + '~';
  Result := Result + BoolToStr(cxantisocial_life.Checked, True) + '~';

end;

function TfmOVDAdd.GenParams_ych(): string;
begin
  result := '';
  result := result + VarToStr(ginformation) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
end;

function TfmOVDAdd.GenParams_adreg(): string;
begin
  result := '';

  IF cxTextEdit2.Text <> '' then
    result := result + cxTextEdit2.Text + '~'
  else
    result := result + 'NULL' + '~';

  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox5) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox7) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox8) + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + VarToStr(ginformation) + '~';

end;

function TfmOVDAdd.GenParams_adprj(): string;
begin
  result := '';

  IF cxTextEdit5.Text <> '' then
    result := result + cxTextEdit4.Text + '~'
  else
    result := result + 'NULL' + '~';

  IF cxTextEdit6.Text <> '' then
    result := result + cxTextEdit6.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox9) + '~';
  result := result + GetLcbValue(cxLookupComboBox10) + '~';
  result := result + GetLcbValue(cxLookupComboBox11) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + GetLcbValue(cxLookupComboBox12) + '~';

  IF cxTextEdit4.Text <> '' then
    result := result + cxTextEdit4.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + VarToStr(ginformation) + '~';

end;

function TfmOVDAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmOVDAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmOVDAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmOVDAdd.PageShow;
var
  I: Integer;
begin
  I := Pos(cxGrinformation.Hint, gShowForm);
  if I = 0 then
  begin
    cxGrinformation.TabVisible := False;
  end;

  I := Pos(cxAdress.Hint, gShowForm);
  if I = 0 then
  begin
    cxAdress.TabVisible := False;
  end;

  I := Pos(cxCriminal.Hint, gShowForm);
  if I = 0 then
  begin
    cxCriminal.TabVisible := False;
  end;

  I := Pos(cxDocument.Hint, gShowForm);
  if I = 0 then
  begin
    cxDocument.TabVisible := False;
  end;

  I := Pos(cxEducation.Hint, gShowForm);
  if I = 0 then
  begin
    cxEducation.TabVisible := False;
  end;

  I := Pos(cxFamily.Hint, gShowForm);
  if I = 0 then
  begin
    cxFamily.TabVisible := False;
  end;

  I := Pos(cxltpCure.Hint, gShowForm);
  if I = 0 then
  begin
    cxltpCure.TabVisible := False;
  end;

  I := Pos(cxLTPExtension.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPExtension.TabVisible := False;
  end;

  I := Pos(cxLTPInformation.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPInformation.TabVisible := False;
  end;

  I := Pos(cxLTPPenalty.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPPenalty.TabVisible := False;
  end;

  I := Pos(cxLTPPreventive.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPPreventive.TabVisible := False;
  end;

  I := Pos(cxLTPRefusall.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPRefusall.TabVisible := False;
  end;

  I := Pos(cxLTPReward.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPReward.TabVisible := False;
  end;

  I := Pos(cxLTPTraining.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPTraining.TabVisible := False;
  end;

  I := Pos(cxLTPWork.Hint, gShowForm);
  if I = 0 then
  begin
    cxLTPWork.TabVisible := False;
  end;

  I := Pos(cxMedAssessment.Hint, gShowForm);
  if I = 0 then
  begin
    cxMedAssessment.TabVisible := False;
  end;

  I := Pos(cxMedExamination.Hint, gShowForm);
  if I = 0 then
  begin
    cxMedExamination.TabVisible := False;
  end;

  I := Pos(cxMedInspector.Hint, gShowForm);
  if I = 0 then
  begin
    cxMedInspector.TabVisible := False;
  end;

  I := Pos(cxOffenses.Hint, gShowForm);
  if I = 0 then
  begin
    cxOffenses.TabVisible := False;
  end;

  I := Pos(cxPrevention.Hint, gShowForm);
  if I = 0 then
  begin
    cxPrevention.TabVisible := False;
  end;

  I := Pos(cxReferralData.Hint, gShowForm);
  if I = 0 then
  begin
    cxReferralData.TabVisible := False;
  end;

  I := Pos(cxSocAssessment.Hint, gShowForm);
  if I = 0 then
  begin
    cxSocAssessment.TabVisible := False;
  end;

  I := Pos(cxSocLegal.Hint, gShowForm);
  if I = 0 then
  begin
    cxSocLegal.TabVisible := False;
  end;

  I := Pos(cxWork.Hint, gShowForm);
  if I = 0 then
  begin
    cxWork.TabVisible := False;
  end;
end;

procedure TfmOVDAdd.InitForm;
begin

  dbSex := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM v_sex AS s  ', []);
  dsSex.DataSet := dbSex.DataSet;

  dbMarital_status := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM marital_status AS s  ', []);
  dsMarital_status.DataSet := dbMarital_status.DataSet;

  dbCitizenship := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_citizenship AS s  ', []);
  dsCitizenship.DataSet := dbCitizenship.DataSet;

  dbCategory := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM citizen_category AS s  ', []);
  dsCategory.DataSet := dbCategory.DataSet;

  dbArea := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_area AS s  ', []);
  dsArea.DataSet := dbArea.DataSet;

  dbArea_p := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_area AS s  ', []);
  dsArea_p.DataSet := dbArea_p.DataSet;

  dbYch := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.family_name||'' ''||s.name||'' ''||s.patronymic as FIO '+
     '   FROM members_user AS s  '+
   ' where s.name_org_id = '+ VarToStr(gUserOrg), []);
  dsYch.DataSet := dbYch.DataSet;

  ListRequired := TList<TComponent>.Create;
end;

procedure TfmOVDAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
end;

end.
