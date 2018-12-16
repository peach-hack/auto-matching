import { Wrapper, shallowMount } from "@vue/test-utils";
import Hello from "../../components/HelloVue.vue";

describe("HelloVue.vue", () => {
  /** ラッパー変数の宣言 */
  let wrapper: Wrapper<Hello>;

  xit("propsで受け取る値のテスト", () => {
    // 準備
    const val = "Vue";
    wrapper = shallowMount(Hello, {
      propsData: { val }
    });

    // 検証
    expect(wrapper.props().val).toBe(val);
    expect(wrapper.text()).toMatch("Hello VUE");
  });

  it("描画されるDOMのテスト", () => {
    // 準備
    wrapper = shallowMount(Hello);

    // 検証
    expect(wrapper.contains("h1")).toBeTruthy();
    expect(wrapper.contains("input")).toBeTruthy();
    expect(wrapper.contains("button")).toBeTruthy();
  });

  it("ボタンの非活性のテスト", () => {
    // 準備
    wrapper = shallowMount(Hello);
    const button = wrapper.find("button");

    // 実行
    wrapper.setData({ inputValue: "" });

    // 検証
    expect(button.element.getAttribute("disabled")).toBeTruthy();
  });

  describe("イベントのテスト", () => {
    beforeEach(() => {
      wrapper = shallowMount(Hello);
    });

    it("テキスト入力時にhandleInputが呼ばれるかテスト", () => {
      // 準備
      const spy = jest.spyOn(wrapper.vm, "handleInput");

      // 実行
      wrapper.find("input").trigger("input");

      // 検証
      expect(spy).toHaveBeenCalled();
    });

    it("ボタン押下時にhandleClickが呼ばれるかテスト", () => {
      // 準備
      const spy = jest.spyOn(wrapper.vm, "handleClick");
      wrapper.setData({ inputValue: "AAA" });

      // 実行
      wrapper.find("button").trigger("click");

      // 検証
      expect(spy).toHaveBeenCalled();
    });

    it("入力なしの状態でhandleClickが呼ばれないかテスト", () => {
      // 準備
      wrapper = shallowMount(Hello);
      const spy = jest.spyOn(wrapper.vm, "handleClick");
      wrapper.setData({ inputValue: "" });

      // 実行
      wrapper.find("button").trigger("click");

      // 検証
      expect(spy).not.toHaveBeenCalled();
    });
  });

  describe("watcherのテスト", () => {
    xit("valueの値が変更された時にwatchが機能するかテスト", () => {
      // 準備
      wrapper = shallowMount(Hello, {
        propsData: { val: "AAA" }
      });
      const spy = jest.spyOn(console, "log");

      // 実行
      wrapper.setData({ value: "BBB" });

      // 検証
      expect(wrapper.vm.value).toBe("BBB");
      expect(spy).toHaveBeenCalledWith("watch: BBB, AAA");

      spy.mockClear();
    });
  });

  describe("computedのテスト", () => {
    beforeEach(() => {
      wrapper = shallowMount(Hello);
    });

    it("isDisabledがtrueを返すかテスト", () => {
      // 実行
      wrapper.setData({ inputValue: "" });
      const disabled = wrapper.vm.isDisabled;

      // 検証
      expect(disabled).toBeTruthy();
    });

    it("isDisabledがfalseを返すかテスト", () => {
      // 実行
      wrapper.setData({ inputValue: "AAA" });
      const disabled = wrapper.vm.isDisabled;

      // 検証
      expect(disabled).toBeFalsy();
    });
  });

  describe("methodのテスト", () => {
    beforeEach(() => {
      wrapper = shallowMount(Hello);
    });

    it("handleInputメソッドのテスト", () => {
      // 準備
      const event = {
        target: { value: "AAA" }
      } as any;

      // 実行
      wrapper.vm.handleInput(event);

      // 検証
      expect(wrapper.vm.inputValue).toBe("AAA");
    });

    it("handleClickメソッドのテスト", () => {
      // 準備
      wrapper.setData({ inputValue: "AAA" });
      const spy = jest.spyOn(wrapper.vm, "$emit");

      // 実行
      wrapper.vm.handleClick();

      // 検証
      expect(wrapper.vm.value).toBe("AAA");
      expect(wrapper.vm.inputValue).toBe("");
      expect(spy).toHaveBeenCalledWith("handle-click", "AAA");
    });
  });

  describe("filtersのテスト", () => {
    it("アッパーケースに変換されるかテスト", () => {
      // 準備
      wrapper = shallowMount(Hello, {
        propsData: { val: "" }
      });
      wrapper.setData({ value: "Bbb" });

      // 実行
      const received = wrapper.find("h1").text();

      // 検証
      expect(received).toBe("Hello BBB");
    });
  });

  describe("スナップショットテスト", () => {
    it("HelloVueテンプレートのスナップショット", () => {
      // 準備
      wrapper = shallowMount(Hello);

      // 検証
      expect(wrapper.html()).toMatchSnapshot();
    });
  });
});
